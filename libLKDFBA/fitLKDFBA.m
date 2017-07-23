function [optimalParams,solverStatus,solverPopulation] = fitLKDFBA(odeTimeVec,odeConcMatrix,odeFluxMatrix,modelStruct,dataWeightVector,fitOptions)
% This function fits an FBA model to the provided data, presumed to be from
% an ODE model of the same stoichiometric and regulatory structure.
%
% optimalParams is a matrix containing the optimal parameters as
% determined by the fitting procedure specified by the inputs. It is an
% (n x 2) matrix, where n is the number of kinetics interactions in the
% model to be fit. Rows in this matrix correspond to the parameters for the
% regualtory interactions. The first column is the slope term (a), and the
% second column the offset term (b) in regulatory interactions described by
%       v(t) <= a*x(t) + b
%
% solverStatus is a structure containing output and diagnostic information
% provided by the solver.
%
% solverPopulation is a structure containing incremental progress by the
% solver. This is useful for investigating progress or intermediate steps
% in the solution procedure.
% 
% odeTimeVec is a vector with the timepoints of the model.
% 
% odeConcMatrix is the metabolite concentration time course data. Rows
% correspond to time points in odeTimeVec. Columns correspond to
% metabolites in the ODE model.
% 
% odeFluxMatrix is the flux time course data. Rows correspond to time
% points in odeTimeVec. Columns correspond to flux values in the ODE model.
%
% modelStruct is a data structure containing the information necessary to
% build the LK-DFBA model using calcLKDFBA(). This includes model stoichiometry,
% bounds on fluxes and concentration values, and the kinetics interactions described in theLK-DFBA model.
%
% dataWeightVector is a vector describing the weights of the metabolites
% and fluxes in the objective function for parameter fitting. It is a row
% vector with m+n elements, where m is the number of concentrations (number
% of columns in odeConcMatrix), and n is the number of fluxes (number of
% columns in odeFluxMatrix).
%
% fitOptions is a data structure containing additional parameters and
% options for specifying the fitting procedure.
%
% Written by RA Dromms 2016, with miscellaneous edits through July 2017.


    silentFitOutput = true;
    
    % First, a little sanity checking...
    if isempty(odeConcMatrix) && isempty(odeFluxMatrix)
        error('No data to fit; cannot procede.');
    end
    
    if ~isempty(odeConcMatrix)
        fitProblemStruct.odeConcMatrix = odeConcMatrix;
    end
    
    if ~isempty(odeFluxMatrix)
        fitProblemStruct.odeFluxMatrix = odeFluxMatrix;
    end

    if ~exist('dataWeightVector','var') || isempty(dataWeightVector)
        error('No weights have been assigned.')
    end
    if all(dataWeightVector==0)
        error('All-zero weight vector.');
    end
    fitProblemStruct.weightVector = dataWeightVector;
    
    if ~exist('fitOptions','var')
        fitOptions = [];
    end
    
    if ~isfield(fitOptions,'nTries')
        fitOptions.nTries = 1;
    end
    
    % This default is based on some quick empirical testing in the branch
    % pathway model with the Regression+ method.
    if ~isfield(fitOptions,'nTriesPerturbation')
        fitOptions.nTriesPerturbation = 1e-4;
    end
    
    % We also want to enforce a minimum nT for the internal FBA problem
    if ~isfield(modelStruct,'minNt')
        modelStruct.minNt = 100;
    end
    
    % Add a penalty for parameter size
    if ~isfield(fitOptions,'penaltyWeight')
        fitOptions.penaltyWeight = [];
    end
    
    % By default, we pick fminsearch
    if ~isfield(fitOptions,'solverType')
        fitOptions.solverType = 'fminsearch';
        % fbaParams.solverType = 'fmincon';
        % fbaParams.solverType = 'ga';
    end
    
    % By default, use initial linear fit as reference for fitting regularization
    if ~isfield(fitOptions,'useNonzeroRegularization')
        fitOptions.useNonzeroRegularization = true;
    end
    
    if ~isfield(fitOptions,'fitProgressDisplay')
        if strcmp(fitOptions.solverType,'ga')
            fitOptions.fitProgressDisplay = 'final'; % Default for for GA display
        else
            fitOptions.fitProgressDisplay = 'off'; % Default for for non-GA display
        end
    end
    
    % Set up options for GA
    if strcmp(fitOptions.solverType,'ga')

        % And let's lock in our ga settings
        optionsString = 'gaoptimset(''PopInitRange'',rangeMatrix';

        optionsString = sprintf('%s,''Display'',''%s''',optionsString,fitOptions.fitProgressDisplay);
        
        if isfield(fitOptions,'gaPopulationSize')
            optionsString = sprintf('%s,''PopulationSize'',%d',optionsString,fitOptions.gaPopulationSize);
        end

        if isfield(fitOptions,'gaTolFun')
            optionsString = sprintf('%s,''TolFun'',%f',optionsString,fitOptions.gaTolFun);
        end

        if isfield(fitOptions,'gaGenerations')
            optionsString = sprintf('%s,''Generations'',%d',optionsString,fitOptions.gaGenerations);
        end

        if ~isfield(fitOptions,'gaSecondaryOptimization')
            fitOptions.gaSecondaryOptimization = true;
        end 
        if fitOptions.gaSecondaryOptimization
            optionsString = sprintf('%s,''HybridFcn'',@fmincon',optionsString);
        end

        optionsString = sprintf('%s)',optionsString);
        
    end
    
    % Make sure we have a LB and UB for parameters defined
    numRegs = size(modelStruct.kineticsMap,1);
    if ~isfield(fitOptions,'pLB')
        fitOptions.pLB = -inf(numRegs,2);
    end
    if ~isfield(fitOptions,'pUB')
        fitOptions.pUB = inf(numRegs,2);
    end
    
    paramUBs = fitOptions.pUB;
    paramLBs = fitOptions.pLB;
    
    if size(paramUBs,1) ~= numRegs
        paramUBs = paramUBs';
        paramLBs = paramLBs';
    end
    
    if size(paramUBs,1) ~= numRegs
        error('Bad Parameter Bounds (pUB) Specified')
    elseif size(paramLBs,1) ~= numRegs
        error('Bad Parameter Bounds (pLB) Specified')
    end
    
    % Check if we have parameters we're not fitting
    if ~isfield(fitOptions,'fixedParameterSequence')
        fitOptions.fixedParameterSequence = false(numRegs,1);
    else
        fitOptions.fixedParameterSequence = logical(fitOptions.fixedParameterSequence);
    end
    
    
    % Set up a structure for the specific fitting problem
    fitProblemStruct.modelStruct = modelStruct;
    fitProblemStruct.tStart = odeTimeVec(1);
    fitProblemStruct.tEnd = odeTimeVec(end);
    fitProblemStruct.nT = length(odeTimeVec)-1;
    fitProblemStruct.x0 = odeConcMatrix(1,:);
    
    
    % 1. Generate initial parameters
    
    % We want to keep track of which params we're not actually fitting;
    % No reason to regularize towards bad placeholder guesses.
    guessedParams = false(numRegs,1);

    % If we want to seed specific initial parameters using fitOptions:
    if isfield(fitOptions,'seedParameters') && ~isempty(fitOptions.seedParameters)
        linearParamsMatrix = fitOptions.seedParameters;
        
    % Otherwise, let's do our typical regression routine.
    else
        % Make sure we have a slight buffer relative to size of x0, in case
        % we need to adjust our b value to make the system feasible.
        vx0BufferFraction = 0.01;
        
        % First, we're going to approximate our parameters by regressing to
        % y=a*x+b to find regulatory a and b parameters.
        linearParamsMatrix = nan(numRegs,2);

        for n = 1:numRegs
            
            if all(paramLBs(n,:) == paramUBs(n,:)) && all(~isinf(paramLBs(n,:)))
                % We have non-inf pre-specified values --> don't fit
                linearParamsMatrix(n,:) = paramLBs(n,:);
            else

                % We're regressing fluxes (y) against concentrations (x)
                xData = odeConcMatrix(2:fitProblemStruct.nT,modelStruct.kineticsMap{n,1});
                yData = sum(odeFluxMatrix(2:fitProblemStruct.nT,modelStruct.kineticsMap{n,2}),2);

                idx0 = find((yData==0));
                xData(idx0) = [];
                yData(idx0) = [];

                if isempty(xData)
                    % If we ended up here, then the flux was always zero
                    linearParamsMatrix(n,:) = [0,0];
                elseif all(xData==xData(1))
                    % In cases where all the X_i(t) data isequal to x_i,0:
                    % This means we don't have data for X_i.
                    % In this case, the 'right' behavior isn't well-defined, so we
                    % will just substitute something harmless as our starting point
                    % and let the solver find better numbers later.
                    if paramUBs(n,1) <= 0 && paramLBs(n,1) < 0
                        linearParamsMatrix(n,:) = [max([-0.01,paramLBs(n,1)]),max(sum(odeFluxMatrix(2:end,modelStruct.kineticsMap{n,2}),2)) + 0.01 * odeConcMatrix(1,modelStruct.kineticsMap{n,1})];
                    else
                        linearParamsMatrix(n,:) = [min([ 0.01,paramUBs(n,1)]),max(sum(odeFluxMatrix(2:end,modelStruct.kineticsMap{n,2}),2))];
                    end
                    guessedParams(n) = true;
                else
                    % Other we'll just fit with the linear approximation.
                    linearParamsMatrix(n,:) = polyfit(xData,yData,1);
                end
            end
            
            for k = 1:length(modelStruct.kineticsMap{n,1})
                v0 = linearParamsMatrix(n,1) * fitProblemStruct.x0(modelStruct.kineticsMap{n,1}(k)) + linearParamsMatrix(n,2);
                if v0 < sum(modelStruct.vBounds(modelStruct.kineticsMap{n,2},1))
                    % If this happens, we need to adjust b so that v(x0) is
                    % a valid flux value, i.e. it exceeds the (sum of the)
                    % lower bounds of the target flux. If reversible
                    % reactions are split into forward and reverse
                    % reactions, we should expect this lower bound sum to
                    % always be zero.
                    linearParamsMatrix(n,2) = linearParamsMatrix(n,2) - (1 + vx0BufferFraction)*v0;
                end
            end
            
        end
    end
    
    % What is our reference vector for parameter regularization?
    if fitOptions.useNonzeroRegularization
        % Regularize towards our linear approximations
        fitProblemStruct.referenceParams = linearParamsMatrix;
        % But don't regularize against ones where we used a placeholder
        fitProblemStruct.referenceParams(guessedParams,:) = 0;
        
        % If we don't have a specified penalty, make the penalty 1/(v'*v)
        % so that we expect changes to be on the order of 1, like SSE
        if isempty(fitOptions.penaltyWeight)
            fitOptions.penaltyWeight = 1/(sum(fitProblemStruct.referenceParams(:).^2) / numel(fitProblemStruct.referenceParams));
        end
        
    else
        % Regularize towards a zero-vector
        fitProblemStruct.referenceParams = zeros(size(linearParamsMatrix));
        
        % If we don't have a default penalty, default to a value of 1e-3
        % since we can't use the magnitude of this to determine how to
        % scale things.
        if isempty(fitOptions.penaltyWeight)
            fitOptions.penaltyWeight = 1e-3;
            
        end
        
    end
    
    fitProblemStruct.fitOptions = fitOptions;
    fitProblemStruct.penaltyWeight = fitOptions.penaltyWeight;
    
% %     fbaProblemStruct.fitOptions.penaltyWeight = fitOptions.penaltyWeight;

    
    % The GA and fmincon benefit greatly from a reduced parameter search
    % space. This gets rid of some a priori problematic parameter combos.
    if strcmp(fitOptions.solverType,'ga') ||  strcmp(fitOptions.solverType,'fmincon')
        
        % Narrow down the parameter search space
        A_ineq = zeros(2*numRegs,2*numRegs);
        b_ineq = zeros(2*numRegs,1);

        % Add b_i-constraints for when a_i < 0 --> Potentially infeasible
        A_ineq(1:numRegs,:) = -[diag(fitProblemStruct.x0([modelStruct.kineticsMap{:,1}])),eye(numRegs)];
        for i = 1:numRegs
           b_ineq(i) = -min(modelStruct.vBounds(modelStruct.kineticsMap{i,2},1));
        end

        % Which a_k are allowed to be positive and negative?
        idxPos = paramLBs(:,1)>=0;
        idxNeg = paramUBs(:,1)<=0;
        
        for i = 1:numRegs

            % If a > 0: enforce  b < min(vMax)...
            % UNLESS min(vMax) = inf; this causes issues with ga()
            if idxPos(i) && ~idxNeg(i) && ~isinf(min(modelStruct.vBounds(modelStruct.kineticsMap{i,2},2)))
                A_ineq(numRegs+i,numRegs+i) = 1;
                b_ineq(numRegs+i) = min(modelStruct.vBounds(modelStruct.kineticsMap{i,2},2));
            end

            % If a<0: enforce  b > max(vMin) --> -b < -max(vMin)...
            % UNLESS max(vMin) = -inf; this causes issues with ga()  
            if idxNeg(i) && ~idxPos(i) && ~isinf(max(modelStruct.vBounds(modelStruct.kineticsMap{i,2},1)))
                A_ineq(numRegs+i,numRegs+i) = -1;
                b_ineq(numRegs+i) = -max(modelStruct.vBounds(modelStruct.kineticsMap{i,2},1));
            end 
        end
    end

    if fitOptions.nTries == 0 || isempty(fitOptions.fixedParameterSequence)
        % In these cases, we're not doing a secondary optimization, and
        % we're only going to return the results of the regression
        % procedure.
        optimalParams =  linearParamsMatrix;
        
        % We need to fill in junk for this stuff
        solverPopulation = [];
        solverStatus = struct('flag','Regression','fval', 'NaN','guessedParams',guessedParams);
        
    else
    
        % We explored at one point a 'leapfrogging' partial optimization
        % strategy. The idea is to fix subsets of parameters, and to only fit
        % some of at a time. This cuts down on the parameter optimzaiton space,
        % which nets potentially huge gains in performance time, at the expense
        % of potentially losing useful directions in which the solver can push
        % during the optimization. The pattern for this procedure is
        % specified by the columns of the matrix,
        % fitOptions.fixedParameterSequence

        % The starting point is the apprixmation via linear regression or
        % the supplied nominal parameter set.
        currentParamsMatrix = linearParamsMatrix;

        % Each column of fixedMatrix represents an iteration of the fixed
        % parameter subset.
        fixedMatrix = fitOptions.fixedParameterSequence;
        
        for j = 1:size(fixedMatrix,2)
            
            % This is a procedure for multiple passes in
            % which the weights of the metabolites in the objective
            % function are iteratively adjusted to penalize error in the
            % simulated model relative to the data. This helps to normalize
            % between terms.
            
            if isfield(fitOptions,'useHeuristicWeights') && fitOptions.useHeuristicWeights
                
                nMetabs = size(odeConcMatrix,2);
                scaleVector = range(odeConcMatrix,1);
                      
                % Calculate error terms
                errorVector = sqrt(abs(calcFcnErrVector(currentParamsMatrix,fitProblemStruct)));
                
                % Adjust weights to magnitude of error terms
                weightVector(1:nMetabs) = errorVector(1:nMetabs)./(scaleVector.^2);
                
                % Remove some pathological behaviors
                weightVector(fitProblemStruct.weightVector(1:length(weightVector))==0) = 0;
                weightVector(isnan(weightVector)) = 0;
                weightVector(isinf(weightVector)) = 0;
                weightVector(1:nMetabs) = weightVector(1:nMetabs)/sum(weightVector(1:nMetabs));

                % Update weights
                fitProblemStruct.weightVector(1:nMetabs) = weightVector;
            end
            

            % Put the fixed parameters into a form that we can pass to the
            % optimization function and assign correctly
            fixedList = fixedMatrix(:,j);
            fixedParams = currentParamsMatrix;
            fixedParams(~fixedList,:) = nan;
            numFittedRegs = nnz(~fixedList);

            % We might need to edit our contraints if they're no longer
            % relevant when some parameters are fixed
            if strcmp(fitOptions.solverType,'ga') ||  strcmp(fitOptions.solverType,'fmincon')

                A_ineq_j = A_ineq;
                b_ineq_j = b_ineq;

                pLB = fitOptions.pLB;
                pUB = fitOptions.pUB;

                % Remove columns for 'fixed' parameters
                A_ineq_j(:,[fixedList; fixedList]) = [];
                pLB([fixedList; fixedList]) = [];
                pUB([fixedList; fixedList]) = [];

                % Remove non-constraints from the system
                idx = logical(all(A_ineq_j==0,2));
                A_ineq_j(idx,:) = [];
                b_ineq_j(idx) = [];

            end


            if  strcmp(fitOptions.solverType,'ga')
                % The GA only will run once per column of fixedMatrix;
                % it's too expensive to try it multiple times per fixedList
                % (i.e., GA always runs as fitOptions.nTries = 1)

                % Set up our initial search box from linear fit
                initParams = currentParamsMatrix(~fixedList,:);

                rangeMatrixL = zeros(size(initParams));
                rangeMatrixU = zeros(size(initParams));
                
                rangeMatrixL(:,1) = sign(initParams(:,1)) .* 10 .^ ( log10(abs(initParams(:,1))) - fitOptions.nTriesPerturbation * sign(initParams(:,1)));
                rangeMatrixL(:,2) = initParams(:,2) - fitOptions.nTriesPerturbation * abs(initParams(:,2));
                rangeMatrixU(:,1) = sign(initParams(:,1)) .* 10 .^ ( log10(abs(initParams(:,1))) + fitOptions.nTriesPerturbation * sign(initParams(:,1)));
                rangeMatrixU(:,2) = initParams(:,2) + fitOptions.nTriesPerturbation * abs(initParams(:,2));

                % Goes into the GA optionsString, defined earlier
                rangeMatrix = [rangeMatrixL(:)';rangeMatrixU(:)'];

                % Solve with GA
                [solverX,solverFval,solverFlag,solverStatusj,solverPopulationj] = ga(@(x) calcFcnErrWrapper(x,fitProblemStruct,fixedParams),numel(initParams),A_ineq_j,b_ineq_j,[],[],pLB,pUB,[],[],eval(optionsString));
                
                % Let's update our parameters to reflect our progress
                currentParamsMatrix = fixedParams;
                currentParamsMatrix(~fixedList,:) = reshape(solverX,numFittedRegs,2);
                
                solverStatusj.flag = solverFlag;
                solverStatusj.fval = solverFval;                
                solverStatusj.resultingParams = currentParamsMatrix;
                solverStatus(j) = solverStatusj;
                
                solverPopulation{j} = solverPopulationj;

            else
                clear tracking
                
                % nTries specifies how many times we try fitting using this
                % fixed parameters list. After the first try, we start adding
                % random perturbations to the regression parameter values,
                % hoping we can dislodge ourselves from this local minima into
                % a better solution.
                firstTry = true;
                
                for i = 1:fitOptions.nTries
                        fprintf('\n\t\tj=%d, i=%d',j,i);

                    if firstTry &&strcmp(fitOptions.fitProgressDisplay,'iter')
                        fprintf('\n');
                    end
                    
                    perturbationSize = fitOptions.nTriesPerturbation;
                    successFlag = false;
                    innerTic = tic;

                    % Bad parameters might lead to the solver screwing
                    % up or failing
                    while ~successFlag

                        initParams = currentParamsMatrix(~fixedList,:);
                        
                        % After trying the initial supplied parameters, try
                        % adding a small random perturbation for
                        % additional fitting tries.
                        if ~firstTry
                            initParams(:,1) = sign(initParams(:,1)) .* 10.^( log10(abs(initParams(:,1))) + perturbationSize * randn(numFittedRegs,1));
                            initParams(:,2) = initParams(:,2) + perturbationSize * (initParams(:,2) .* randn(numFittedRegs,1));

                            % If we keep getting stuck here, maybe we need
                            % a larger pertrubaiton next time to get out
                            perturbationSize = perturbationSize * 1.01;
                        end
                        firstTry = false;
                        
                        try
                            % Try calcLKDFBA with current params 
                            testParams = currentParamsMatrix;
                            testParams(~fixedList,:) = initParams;
                            [~,~,~,testStatus] = calcLKDFBA(fitProblemStruct.tStart,...
                                                         fitProblemStruct.tEnd,...
                                                         fitProblemStruct.nT,...
                                                         fitProblemStruct.x0,...
                                                         fitProblemStruct.modelStruct.S,...
                                                         fitProblemStruct.modelStruct.xBounds,...
                                                         fitProblemStruct.modelStruct.vBounds,...
                                                         fitProblemStruct.modelStruct.kineticsMap,...
                                                         testParams,...
                                                         fitProblemStruct.modelStruct);
                        catch
                            % We probably have too large a perturbation
                            % Reset and try again
                            testStatus.status = 'error';
                            perturbationSize = fitOptions.nTriesPerturbation;
                            if strcmp(fitOptions.fitProgressDisplay,'iter')
                                fprintf('\t\tParameter Test Failure; Perturbation = %g\n',perturbationSize)
                            end
                        end
                        
                        
                        % Only progress if current params gives a valid LP!
                        if strcmp(testStatus.status,'OPTIMAL')

                            % Let's try to solve for the local minima, given
                            % the current attempted parameters guess
                            try
                                if strcmp(fitOptions.solverType,'fmincon')
                                    [solverX,solverFval,solverFlag,solverStatusi] = fmincon(@(x) calcFcnErrWrapper(x,fitProblemStruct,fixedParams),initParams(:)',A_ineq_j,b_ineq_j,[],[],pLB,pUB,[],optimoptions('fmincon','Display',fitOptions.fitProgressDisplay));
                                else
                                    [solverX,solverFval,solverFlag,solverStatusi] = fminsearch(@(x) calcFcnErrWrapper(x,fitProblemStruct,fixedParams),initParams(:)',optimset('Display',fitOptions.fitProgressDisplay));
                                end

                                if ~isinf(solverFval)
                                    solvedParams = fixedParams;
                                    solvedParams(~fixedList,:) = reshape(solverX,numFittedRegs,2);
                                    successFlag = true;
                                end
                            catch fitError
                                % If we got stuck in a loop here,
                                % we'll see this repeated over and over in the
                                % console. This usually means that there's some
                                % issue calculating the FBA problem, usually
                                % due to some bug in setting up the
                                % optimization problem before we even got this
                                % far.  
                                % Edit 2016-12-19 RAD: Updated this so that
                                % after only a single attempt, if we throw and
                                % error, we start immediately adding a
                                % perturbation to the parameters, instead of
                                % waiting until i=2. This might help prevent
                                % stalling out when the Regression parameters
                                % are fundamentally bad and are the cause of
                                % the error.
                                fprintf('\n\t\t  Error when j=%d, i=%d. Message:\n',j,i)
                                fprintf('\t\t  %s\n',fitError.message);
                                % Make sure we don't spam the license
                                % server with bad calls to gurobi
                                if ~isempty(strfind(fitError.message,'Gurobi error 10009'))
                                    fprintf('\t\tGurobi Error--Pausing Briefly\n')
                                    pause(5*rand)
                                end
                            end

                        %Otherwise, just leave successFlag false
                        end
                    end

                    % Record what came out: partially for debugging,
                    % partially so that we can pick our best result at the
                    % end 
                    tracking(i).runtime = toc(innerTic);
                    tracking(i).paramsF = solvedParams;

                    tracking(i).paramsI = fixedParams;
                    tracking(i).paramsI(~fixedList,:) = initParams;

                    tracking(i).fval = solverFval;
                    tracking(i).flag = solverFlag;
                    tracking(i).solverStatus = solverStatusi;
                    tracking(i).method = fitOptions.solverType;

                end

                % Pick the current best fit after multiple attempts
                [~,idxBest] = min([tracking.fval]);
                currentParamsMatrix = tracking(idxBest).paramsF;
                
                solverPopulation{j} = tracking;
                
                solverStatusj = tracking(idxBest).solverStatus;
                solverStatusj.flag = tracking(idxBest).flag;
                solverStatusj.fval = tracking(idxBest).fval;
                solverStatusj.resultingParams = currentParamsMatrix;
                solverStatus(j) =  solverStatusj;
                
            end
        end
        
        % Pass out results back out
        optimalParams = currentParamsMatrix;   
        fprintf('\t  ');
    end
    
end


function totalError = calcFcnErrWrapper(fitParams,paramStruct,fixedParams)
% This wrapper combines the fitted and fixed parameters into the right
% format to get evaluated by my error function. This lets me reduce the
% search space when I want to pre-specify parameters.
    
    functionParams = reshape(fixedParams,numel(fixedParams)/2,2);
    functionParams(any(isnan(fixedParams),2),:) = reshape(fitParams,numel(fitParams)/2,2); 
    
    % New feature: allow user to supply custom fitness functions
    % This is supplied by the string "paramStruct.fitnessFunction"
    % containing the name of the .m file with the custom function. These
    % functions must have the same syntax as defaultCalcFcnErr()
    if isfield(paramStruct,'fitnessFunction') && ~isempty(paramStruct.fitnessFunction) && isa(paramStruct.fitnessFunctionName,'string') && exist(sprintf('%s.m',paramStruct.fitnessFunctionName),'file')
        % Convert the string to the function handle
        eval(sprintf('customCalcFcnErr = @%s;',paramStruct.fitnessFunctionName))
        % Evaluate fitness based on the custom function
        totalError = feval(customCalcFcnErr,functionParams,paramStruct);
    else
        % By default, use the defaultCalcFcnErr() specified below
        totalError = defaultCalcFcnErr(functionParams,paramStruct);
    end
    
end

function totalError = defaultCalcFcnErr(fitParams,paramStruct)
% This is what we're throwing in the solver when we optimize parameters
% It does some formatting/bookkeeping, calls the FBA routine, then
% calculates our error relative to the training data, subject to the
% specified weight vector.

    % This may seem asinine to convert to/from vector form multiple times
    % but apparently I need to format into this for
    % accommodating the GA implementation.
    fitParams = fitParams(:)';
    regulationParams = [fitParams(1:end/2)',fitParams(end/2+1:end)'];
    
    % A vector with the weight of each item in concMatrix and fluxMatrix,
    % [conc weights, flux weights, pooling flux weights]
    weights = paramStruct.weightVector;
    
    % In case we want to externally provide arbitrary ODE meshes eventually
    % RAD: In the future, replacing weightVector with a matrix would allow
    % time-dependent weighting. However, we haven't pursued anything like
    % that at this time. We'd need a reasonable heuristic for generating
    % those weights (e.g. based on local rate of change in the data) to
    % justify a more complicated approach like that.
    if ~isfield(paramStruct,'odeTimeVec')
         odeTimeVec = linspace(paramStruct.tStart,paramStruct.tEnd,paramStruct.nT+1);
    end
    
    % We also need to be able to interpolate separately for flux time points.
    if ~isfield(paramStruct,'odeFluxTimeVec')
         if length(odeTimeVec) == size(paramStruct.odeFluxMatrix,1)
             odeFluxTimeVec = odeTimeVec;
         elseif length(odeTimeVec) == size(paramStruct.odeFluxMatrix,1) + 1
            odeFluxTimeVec = odeTimeVec(1:end-1)+0.5*diff(odeTimeVec(1:2));
         end
    end
    
    % However, we want constant deltaT for the FBA, as we've formulated it
    nT = paramStruct.modelStruct.minNt;
    if isfield(paramStruct,'nT') && paramStruct.nT > nT
        % This just makes sure we're using a sufficiently large nT value
        % when we run the internal FBA (i.e. no smaller than ODE data nT)
        nT = paramStruct.nT;
    end
        
    % Finally: Run the FBA model with the current parameters
    [timeVec,fbaConcMatrix,fbaFluxMatrix,result] = ...
                                calcLKDFBA(paramStruct.tStart,...
                                        paramStruct.tEnd,...
                                        nT,...
                                        paramStruct.x0,...
                                        paramStruct.modelStruct.S,...
                                        paramStruct.modelStruct.xBounds,...
                                        paramStruct.modelStruct.vBounds,...
                                        paramStruct.modelStruct.kineticsMap,...
                                        regulationParams,...
                                        paramStruct.modelStruct);
    fluxTimeVec = timeVec(1:end-1)+0.5*diff(timeVec(1:2));
    
    % Calculate our errors
    if strcmp(result.status,'OPTIMAL') % || strcmp(result.status,'SUBOPTIMAL')
        
        % Interpolate to ODE timepoints:
        interpConcMatrix = interp1(timeVec,fbaConcMatrix,odeTimeVec,'linear','extrap');
        interpFluxMatrix = interp1(fluxTimeVec,fbaFluxMatrix,odeFluxTimeVec,'linear','extrap');

        % Get our sum of square terms
        errorConcVec = sum((interpConcMatrix-paramStruct.odeConcMatrix).^2,1);
        errorFluxVec = sum((interpFluxMatrix-paramStruct.odeFluxMatrix).^2,1);
        
        % Now do the weighted sum to get total error^2
        totalError = nansum(weights.*[errorConcVec errorFluxVec]);
        
        % Final error is total fitting error + regularization penalty
        totalError = totalError + paramStruct.penaltyWeight*sum((fitParams(:)-paramStruct.referenceParams(:)).^2) / numel(paramStruct.referenceParams);
    else
        % If we ended up here, the FBA model failed. Let's tell the solver
        % that the parameters were no good so that it looks elsewhere.
        totalError = inf;
        % RAD 2016-10-31: This isn't ideal, but I'm not sure at this time
        % that there's a better way to handle this without a more
        % sophisticated framework for doing this optimization, e.g. finding
        % ways to relax constraints of the LP and penalizing accordingly.
    end
    
end

function [errorVector] = calcFcnErrVector(fitParams,paramStruct)
% This is what we're throwing in the solver when we optimize parameters
% It does some formatting/bookkeeping, calls the FBA routine, then
% calculates our error relative to the training data, subject to the
% specified weight vector.

    fitParams = fitParams(:)';
    regulationParams = [fitParams(1:end/2)',fitParams(end/2+1:end)'];
    
    % A vector with the weight of each item in concMatrix and fluxMatrix,
    % [conc weights, flux weights, pooling flux weights]
    weights = paramStruct.weightVector;
    
    % In case we want to externally provide arbitrary ODE meshes eventually
    % RAD: In the future, replacing weightVector with a matrix would allow
    % time-dependent weighting. However, we haven't pursued anything like
    % that at this time. We'd need a reasonable heuristic for generating
    % those weights (e.g. based on local rate of change in the data) to
    % justify a more complicated approach like that.
    if ~isfield(paramStruct,'odeTimeVec')
         odeTimeVec = linspace(paramStruct.tStart,paramStruct.tEnd,paramStruct.nT+1);
    end
    
    % We also need to be able to interpolate separately for flux time points.
    if ~isfield(paramStruct,'odeFluxTimeVec')
         if length(odeTimeVec) == size(paramStruct.odeFluxMatrix,1)
             odeFluxTimeVec = odeTimeVec;
         elseif length(odeTimeVec) == size(paramStruct.odeFluxMatrix,1) + 1
            odeFluxTimeVec = odeTimeVec(1:end-1)+0.5*diff(odeTimeVec(1:2));
         end
    end
    
    % However, we want constant deltaT for the FBA, as we've formulated it
    nT = paramStruct.modelStruct.minNt;
    if isfield(paramStruct,'nT') && paramStruct.nT > nT
        % This just makes sure we're using a sufficiently large nT value
        % when we run the internal FBA (i.e. no smaller than ODE data nT)
        nT = paramStruct.nT;
    end
        
    % Finally: Run the FBA model with the current parameters
    [timeVec,fbaConcMatrix,fbaFluxMatrix,result] = ...
                                calcLKDFBA(paramStruct.tStart,...
                                        paramStruct.tEnd,...
                                        nT,...
                                        paramStruct.x0,...
                                        paramStruct.modelStruct.S,...
                                        paramStruct.modelStruct.xBounds,...
                                        paramStruct.modelStruct.vBounds,...
                                        paramStruct.modelStruct.kineticsMap,...
                                        regulationParams,...
                                        paramStruct.modelStruct);
    fluxTimeVec = timeVec(1:end-1)+0.5*diff(timeVec(1:2));
    
    % Calculate our errors
    if strcmp(result.status,'OPTIMAL') % || strcmp(result.status,'SUBOPTIMAL')
        
        % Interpolate to ODE timepoints:
        interpConcMatrix = interp1(timeVec,fbaConcMatrix,odeTimeVec,'linear','extrap');
        interpFluxMatrix = interp1(fluxTimeVec,fbaFluxMatrix,odeFluxTimeVec,'linear','extrap');
        
        % Calculate L2 Error
        errorConcVec = sum((interpConcMatrix-paramStruct.odeConcMatrix).^2,1);
        errorFluxVec = sum((interpFluxMatrix-paramStruct.odeFluxMatrix).^2,1);
        errorVector = [errorConcVec errorFluxVec];
        
    else
        % If we ended up here, the FBA model failed.
        errorVector = inf(size(weights));
    end
    
end
