function [timeVec,concMatrix,fluxMatrix,solution] = calcLKDFBA(tStart,tEnd,nT,x0,STM,xBounds,vBounds,kineticsMap,kineticsParams,runParams)
% This function performs an LK-DFBA simulation of the dynamics of the
% system specified by STM, kineticsMap, kineticsParams, subject to xBounds,
% vBounds, the initial conditions of X0, and the parameters specified in
% runParams, over the time interval specified by tStart, tEnd, and nT.
% 
% tStart, tEnd, and nT are used to define the time intervals of the
% problem. nT is the number of transitions between system states. These
% transitions are assumed to be uniform over the interval (tStart,tEnd)
% 
% x0 are the initial conditions of the metabolites in the system.
% 
% STM is the original FBA stoichiometric matrix. This is used to build the
% LK-DFBA model by adding constraints describing dynamics and
% regulation. Each row is assumed to correspond to a single
% metabolite, while each column a single system flux. In the current
% implementation, the last column is assumed to be the biomass reaction
% (objective). The number of rows and their sequence in STM is assumed to
% correspond to that of the values in x0.
% 
% xBounds is an array specifying the min and max values allowed for the
% concentration in STM. For each row, the first column specifies the lower
% bound for that metabolite, and the second column the upper bound. The
% number of rows in vBounds should equal the number of rows in STM.
% 
% vBounds is an array specifying the min and max values allowed for the
% fluxes in STM. For each row, the first column specifies the lower bound
% for that flux, and the second column the upper bound. The number of rows
% in vBounds should equal the number of columns in STM.
%
% kineticsMap is a cell array of kinetics interactions to be included
% in the model. The number of kinetics interactions modeled is determined
% by the number of rows in kineticsMap, and corresponds to the order of
% the parameters in kineticsParams. For each row, the first
% column is an array of indices indicating the metabolites that control the
% interaction. The second column is an array of indices indicating which
% fluxes are controlled by those metabolites. The indices referenced in
% kineticsMap must correspond to the order of the metabolites and
% fluxes in STM. This set includes constraints representing mass action
% kinetics that depend on metabolites as substrates for the reaction, as
% well as both positive and negative regulatory interactions such as those
% resulting from allosteric interactions.
% 
% kineticsParams is a list of linear kinetics constraints parameters. This
% list will be used to directly set the parameters for each interaction.
% The first column are the slope parameters, and the second column are the
% offset parameters. The optional third column indicates whether this
% interaction is an equality constraint ('=') or an inequality constraint
% ('<'). By default, all interactions are inequalities. Fluxes are
% constrained by: sum(V_j(t+1)) <= a_i * sum(x_k(t)) + b_i. 
% 
% runParams is an optional structure specifying additional parameters used
% to control specific nuances of how the simulation is performed. runParams
% may have any of the following fields:
% 
%     nTBufferFraction (default = 0.3)
%         Addes an additional buffer to the simulation window, which can help
%         remove problems due to "dumping" at the final time points. This
%         extension is removed from the final results returned by calcFBA.
%     objectiveType (default = 'instant')
%         Specifies whether an 'instant' or 'terminal' objective function
%         is used. 'instant' maximizes the objective flux at each
%         individual timepoint, while 'terminal' maximizes only the
%         objective metaboltie concentration at the final timepoint.         
%     objectiveFluxIndex (No Default Value)
%         Specifies the flux(es) to be used as the objective for the
%         "instant" objecive function.
%     objectiveMetaboliteIndex (Defaults to # metabolites)
%         Specifies the metabolite(s) to be used as the objective for the
%         'terminal' objecive function. If missing and needed, the default
%         assumption is that the final metabolite in STM is the "biomass"
%         or objective metabolite concentration.
%     l2Weight (default = 0)
%         Adds an L2-penalty on the magnitude of the solution. This
%         converts the LP to a QP, where Q of the objective function takes
%         the form Q = l2Weight*I (and is positive for minimization form)
%         
% Written 2015-09-02 by R.A.Dromms, based code from 2015-03-25 that had
% been steadily evolving since then.
% Edited by R.A. Dromms from 2015-Sept to 2017-June for various tweaks and
% improvements.


    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    % Pre-processing                                                      %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %    
    
    % Since this is optional:
    if ~exist('runParams','var')
        runParams = [];
    end

    if ~isfield(runParams,'nTBufferFraction')
        runParams.nTBufferFraction = 0.3;
    end
    
    if ~isfield(runParams,'objectiveType')
        runParams.objectiveType = 'instant';
    end
    
    if ~isfield(runParams,'l2Weight')
        runParams.l2Weight = 0;
    end

    
    % Protection against end-point dumping
    ntBuffer = ceil(nT*runParams.nTBufferFraction);
    
    % Number and size of transitions
    deltaT = (tEnd-tStart)/nT;
    nT = nT + ntBuffer;
    timeVec = (tStart:deltaT:tEnd+ntBuffer*deltaT)';
    
    % Pull out some descriptive numbers
    numMetabs = size(STM,1);
    numSystemFluxes = size(STM,2);
    numRegs = size(kineticsMap,1);

    % Gurobi options
    gurobiParams.outputflag = 0;
                              
    
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    % Initial model specification                                         %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %        
    
    % Add pooling fluxes to the STM
    A = buildPoolingFluxMatrix(sparse(STM));

    % Calculate some more useful descriptive numbers
    numAugmentedFluxes = size(A,2);
    solnLength = numAugmentedFluxes*nT+numMetabs*(nT+1);
    
    % Add in pooling flux bounds
    vBounds(numSystemFluxes+1:numAugmentedFluxes,1) = -inf;
    vBounds(numSystemFluxes+1:numAugmentedFluxes,2) =  inf;
    
    
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    % Unroll the model across time                                        %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    
    L1 = nT*numMetabs; % Number of Stiohiometric Constraints
    L2 = (nT+1)*numMetabs; % Number of Dynamics Constraints
    L3 = nT*numRegs; % Number of Regulatory Constraints
    
    % Let's start building the model: intialize the structure
    model.A = sparse(L1+L2+L3,solnLength);
    model.rhs = zeros(L1+L2+L3,1);
    model.modelsense = 'min';
    % % model.vtype = 'c'; % Default is 'c' anyways. Avoids Gurobi bug.
    
    % Are our regulatory constaints inequality, or equality?
    % We default to inequality unless told otherwise.
    if size(kineticsMap,2) == 3
        regSense = repmat([kineticsMap{:,3}],1,nT)';
    else
        regSense = repmat('<',L3,1);
    end
    model.sense = [repmat('=',L1+L2,1); regSense];
    
    
    % Stoichimetry unrolls to (nT*numMetabs x nT*numAugmentedFluxes) matrix
    model.A(1:L1, 1:nT*numAugmentedFluxes) = ...
        buildStoichiometricConstraintsMatrix(A,nT);
    
    % Dynamics unroll to ([nT+1]*numMetabs x [nT*numAugmentedFluxes+(nT+1)*numMetabs])
    model.A(L1+1:L1+L2, 1:nT*numAugmentedFluxes+(nT+1)*numMetabs) = ...
        buildDynamicsEulerMatrix(numSystemFluxes,numMetabs,nT,deltaT);
    model.rhs(L1+1:L1+length(x0)) = x0;

    % Regulation unrolls to [nT*numRegs x nT*(numAugmentedFluxes+numMetabs)]
    if numRegs ~= 0
        [model.A(L1+L2+1:L1+L2+L3, 1:nT*(numAugmentedFluxes+numMetabs)), model.rhs(L1+L2+1:L1+L2+L3)] = ...
            buildRegulatoryIneqConstraints(kineticsMap,kineticsParams,numMetabs,numAugmentedFluxes,nT);
    end
    
    
    
    % Add lower and upper bounds:
    model.lb = zeros(solnLength,1);
    model.ub = zeros(solnLength,1);
    
    % First, add the flux value bounds, templated over time
    model.lb(1:nT*numAugmentedFluxes) = repmat(vBounds(:,1),nT,1);
    model.ub(1:nT*numAugmentedFluxes) = repmat(vBounds(:,2),nT,1);
    
    % Next, set the bounds for concentrations, templated over time
    model.lb(nT*numAugmentedFluxes+1:nT*numAugmentedFluxes+(nT+1)*numMetabs) = repmat(xBounds(:,1),nT+1,1);
    model.ub(nT*numAugmentedFluxes+1:nT*numAugmentedFluxes+(nT+1)*numMetabs) = repmat(xBounds(:,2),nT+1,1);
    
    
    % Construct the FBA objective
    model.obj = zeros(solnLength,1);
    
    % Case 1) Terminal objective maximizes a final concentration
    if strcmp(runParams.objectiveType,'terminal')
        
        % Does the model specify the metabolite to maximize?
        if isfield(runParams,'objectiveMetaboliteIndex') && ~isempty(runParams.objectiveMetaboliteIndex)
            idxObjMetab = runParams.objectiveMetaboliteIndex;
        else
            % If not, we assume it's the last one in the model
            % For example, an added biomass
            idxObjMetab = numMetabs; % Assume last metabolite
        end
        
        % Assign the objective as the *last time point* metabolite concentration
        for k = 1:length(idxObjMetab)
            model.obj(nT*(numAugmentedFluxes+numMetabs)+idxObjMetab(k)) = -1;
        end
        
    % Case 2) Instant objecive maximizes a flux at all time points
    elseif strcmp(runParams.objectiveType,'instant')

        % We default to a flux index
        if isfield(runParams,'objectiveFluxIndex') && ~isempty(runParams.objectiveFluxIndex)
            
            % This needs to be specified by the model
            % Note that we can target pooling fluxes by setting 
            % idxObjFlux = numSystemFluxes + runParams.objectiveMetaboliteIndex
            idxObjFlux = runParams.objectiveFluxIndex;
            
            % Assign the objective as the target flux over all timepoints
            for k = 1:length(idxObjFlux)
                model.obj(idxObjFlux(k):numAugmentedFluxes:nT*numAugmentedFluxes) = -1;
            end        
        % If we don't have an index for a target flux, we maximize a
        % metabolite in the system over all time points. This is
        % equivalent to maximizing the corresponding pooling flux.
        else
            % Does out model specify the metabolite to maximize?
            if isfield(runParams,'objectiveMetaboliteIndex') && ~isempty(runParams.objectiveMetaboliteIndex)
                idxObjMetab = runParams.objectiveMetaboliteIndex;
            else
                % If not, we assume it's the last one in the model
                % (For example, adding a biomass metabolite)
                idxObjMetab = numMetabs; % Assume last metabolite, for now
            end
            
            % Assign the objective as the target metabolite over all timepoints
            for k = 1:length(idxObjMetab)
                model.obj(nT*numAugmentedFluxes+idxObjMetab(k):numMetabs:nT*(numAugmentedFluxes+numMetabs)+idxObjMetab(k)) = -1;
            end
        end

    else
        error('No FBA Objective Type (''instant'', ''terminal'') Specified')
    end
    
    % If specified, we add a modest penalty on the solution L2-norm
    % THIS CONVERTS THE LP TO A QP! But: This doesn't seem to add a
    % substantial time cost to solving the system, and helps reduce
    % solution degeneracy.
    if runParams.l2Weight ~=0
        model.Q = runParams.l2Weight*speye(solnLength);
    end
    
    
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    % Solving the model                                                   %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    
    solution = gurobi(model, gurobiParams);    solution.timeVec = timeVec;
    
    
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    % Solution Processing                                                 %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    
    if strcmp(solution.status,'OPTIMAL') % || strcmp(solution.status,'SUBOPTIMAL')

        % Pull the actual LP/QP solution out
        solnVector = solution.x;

        % Reshape the solution into the corresponding data matrices
        fluxMatrix = reshape(solnVector(1:numAugmentedFluxes*nT),numAugmentedFluxes,nT)';
        concMatrix = reshape(solnVector(numAugmentedFluxes*nT+1:numAugmentedFluxes*nT+numMetabs*(nT+1)),numMetabs,nT+1)';

        % Remove the buffer extensions from the data
        fluxMatrix(end+1-ntBuffer:end,:) = [];
        concMatrix(end+1-ntBuffer:end,:) = [];
        
    else
       % Model has some fundamental issue; abort!
       fluxMatrix = NaN;
       concMatrix = NaN;
% %        fprintf('Model terminated with status,''%s''. No results returned.\n',solution.status)
    end
    
    timeVec(end+1-ntBuffer:end) = [];
    
end


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Accessory functions                                                     %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    
function outputMatrix = buildDynamicsEulerMatrix(numSystemFluxes,numMetabs,numBlocks,deltaT)
% This function generates a series of constraints representing 1st order
% integration (i.e. Euler method) over NUMBLOCKS transitions of duration
% DELTAT.
%
% numMetabs is an integer specifying the number of metabolites in the
% system.
% 
% numSystemFluxes is an integer specifying the number of fluxes in the
% unaugmented system. There are assumed to be NUMMETABS pooling fluxes in
% the augmented system.
%
% numBlocks is an integer specifices the number of transitions in the
% model. This paramater determines the size of outputMatrix.
%
% deltaT specifies the length of the interval for transitions. Currently,
% we assume that a single value is used for all transitions.
%
% Written 2015-04-07 by R.A.Dromms
% Edited  2015-09-02 by R.A.Dromms: Edited description. Streamlined out
%   loops using kron(); there are now ~10x more comments than actual code
    
    matrix1 = kron(sparse(2:numBlocks+1,1:numBlocks,ones(numBlocks,1)),sparse(1:numMetabs,numSystemFluxes+1:numSystemFluxes+numMetabs,deltaT*ones(numMetabs,1)));
    matrix2 = kron(sparse([1:numBlocks+1,2:numBlocks+1],[1:numBlocks+1,1:numBlocks],[1;-ones(numBlocks,1);ones(numBlocks,1)]),speye(numMetabs));
    
    outputMatrix = [matrix1, matrix2];
    
end

function outputMatrix = buildPoolingFluxMatrix(stoichMatrix)
% Adds pooling fluxes to the stoichometric matrix. Assumes each row of the
% original stoichiometric matrix is a mass balance on a metaboltie held at
% steady-state in a classic FBA problem; pooling fluxes are added to each
% of these metabolites.
% 
% stoichMatrix is the set of instantaneous mass balances dx/dt = S*v on a reaction
% network, represented there as the matrix S. Rows of S describe the mass
% balance over individual metabolites, while columns of S indicate which
% metabolites participate in a given reaction/flux: positive coefficients
% indicate production of a metabolite by that flux, negative
% coefficients indicate consumption, and a coefficient of zero indicates that
% that metabolite does not participate in the reaciton. This function
% produces an augmented stoichiometric matrix A, such that:
%       0 = A*x, where A = [S,-I], and x = [v; dx/dt]
% These dx/dt terms are referred to as "pooling fluxes" in our framework,
% producing an augmented system of fluxes.
%
% Written 2015-04-07 by R.A.Dromms
% Edited  2015-09-03 by R.A.Dromms: Updated the description

    outputMatrix = [sparse(stoichMatrix), -1*speye(size(stoichMatrix,1))];

end


function outputMatrix = buildStoichiometricConstraintsMatrix(templateMatrix,numBlocks)
% Patterns the matrix TEMPLATEMATRIX to produce NUMBLOCKS sets of
% stoichiometric constraints, which represent the stiochiometric mass
% balances over the augmented system fluxes at each time point in the
% unrolled model.
%
% templateMatrix is a matrix containing the augmented stoichiometric
% matrix, which describes the mass balance constraints (including pooling
% fluxes) that hold at any given individual transition between time points
% in the model.
% 
% numBlocks is an integer that specifices the number of transitions in the
% model. This paramater determines the size of outputMatrix.
% 
% Written 2015-03-25 by R.A.Dromms
% Edited  2015-04-01 by R.A.Dromms: Output is now sparse matrix
% Edited  2015-09-02 by R.A.Dromms: Re-implemented using kron()!

    outputMatrix = kron(speye(numBlocks),sparse(templateMatrix));
    
end

function [outputMatrix, rhs] = buildRegulatoryIneqConstraints(regulationSet,regulationParams,numMetabs,numAugmentedFluxes,numBlocks)
% A heavily updated version of the function for unrolling the
% pooling/regulatory constraints over the simulaiton time. This function
% uses the regulation scheme specified in REGULAITONSET with the regulatory
% parameters specified in REGULATIONPARAMS to generate the matrix of
% regulatory constraints, unrolled over NUMBLOCKS model transitions.
% 
% regulationSet is a cell array of regulatory interactions to be included
% in the model. The number of regulatory interactions modeled is determined
% by the number of rows in regulationSet, and corresponds to the order of
% the regulatory parameters in regulationParams. For each row, the first
% column specifies the index of the metabolite that controls regulatory
% interaction. The second column is an array of indices indicated which
% fluxes are controlled by this metabolite. The indices referenced in
% regulationSet should correspond to the order of the metabolites and
% fluxes in STM. This set includes both actual regulatory interactions, as
% well as "pooling constraints" that constrain the efflux from a metabolite
% proprortional to it's current concentration.
% 
% regulationParams is a list of regulatory constraint parameters. For
% testing purposes, this list will be used to directly constrain the
% parameters for  each interaction; future implementations will modify this
% for the bi-level optimizaiton strategey, and the parameters will be fit
% to data. The first column are the a-parameters, and the second column are
% the b-parameters. Fluxes are constrained by:
% V_j(t+1) <= a_i * x_k(t) + b_i. 
% 
% numMetabs is an integer specifying the number of metabolites in the
% system.
% 
% numAugmentedFluxes is an integer specifying the number of fluxes in the
% augmented system. This includes pooling fluxes.
%
% numBlocks is an integer that specifices the number of transitions in the
% model. This paramater determines the size of outputMatrix.
%
% Written 2015-09-02 by R.A.Dromms

    numRegs = size(regulationSet,1);
    
    % 1) Construct controller matrix
    controllerMatrix = spalloc(numRegs,numMetabs,numel([regulationSet{:,1}]));
    for i = 1:numRegs
        controllerMatrix(i,regulationSet{i,1}) = -regulationParams(i,1);
    end
    
    % 2) Construct target matrix
    targetMatrix = spalloc(numRegs,numAugmentedFluxes,numel([regulationSet{:,2}]));
    for i = 1:numRegs
        targetMatrix(i,regulationSet{i,2}) = 1;
    end
    
    % 3) Tile the matrices using kron()
    outputMatrix = [kron(speye(numBlocks),targetMatrix), kron(speye(numBlocks),controllerMatrix)];
    
    % 4) Generate the RHS
    rhs = repmat(regulationParams(:,2),numBlocks,1);
    
end
