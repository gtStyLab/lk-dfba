function fitChass(modelStruct,fitOptions,fitStringList,missingX,resultsFileStem)
% This function sets up parameter fitting for the Chassagnole E.coli model.
%
% modelStruct is the data structure describing the stoichiomery and
% regulatory scheme of the model. It is created outside this function using
% the script setFbaParamsChass.
% 
% fitOptions is the data structure describing how we're running the
% particular fit procedure. Most of the run-specific parameters are stored
% here.
% 
% fitStringList is a cell array containing a list of fit method strings.
% Valid entries for this list are 'LR', 'LR+', and 'GA'.
% 
% missingX is a logical array. Its length corresponds to the number of
% metabolites in the model. A value of 1 or true indicates that the
% corresponding metabolite is being marked as unmeasured, and cannot be
% used in the objective function for the fitting procedure. This lets us
% test the effects of removing subsets of the data on the parameter fitting
% procedure.
% 
% resultsFileStem is a string containing the output file prefix. It
% includes typically informaiton about the ODE data we are fitting.
% Suffixes to this stem are appended indicating the preprocessing and
% parameter fitting procedures in the resulting outputs. This stem is also
% used for the file outputs when we export the intermediate steps or
% automatically perform a simulation using the optimized parameters.
% 
% Written by R.A.Dromms 2016

    % Initialize the fitness weight vector
    if ~isfield(fitOptions,'setIrreversible') || isempty(fitOptions.setIrreversible) || ~fitOptions.setIrreversible
        % [ Metabolites + system fluxes + reverse fluxes + pooling fluxes]
        fitnessWeightVector = zeros(1,   18 + 48 + 13 + 18);
    else    
        % [ Metabolites + system fluxes + reverse fluxes + pooling fluxes]
        fitnessWeightVector = zeros(1,   18 + 48 +  0 + 18);
    end

    % Set fitness function weights if we have them
    if isfield(fitOptions,'allWeights') && ~isempty(fitOptions.allWeights)
        % If we have weights for all model species
        fitnessWeightVector = fitOptions.allWeights;
    elseif ~isfield(fitOptions,'allWeights') && isfield(fitOptions,'metaboliteWeights') && ~isempty(fitOptions.metaboliteWeights)
        % If we just assign weights for metabolites
        fitnessWeightVector(1:18) = fitOptions.metaboliteWeights;
    else
        % Default: Equal weights for all metabolite concentrations
        fitnessWeightVector(1:18) = 1; % Ignore fluxes
    end

    
    % If we're missing metabolites, don't fit to that data!
    % We're using find() here because missingX won't be same length.
    fitnessWeightVector(find(missingX)) = 0;

    
    switch fitOptions.fitPreprocessScheme
        case 1
            suffix = '_noPreprocess';
        case 2
            suffix = '_smoothed';
        case 3
            suffix = '_smoothedBackslash';
            % We shouldn't fit to inferred values for fluxes
            fitnessWeightVector(19:end) = 0;
        otherwise
            % Default to noPreProcess, and skip the suffix
            suffix = '';
            fitOptions.fitPreprocessScheme = 1;
    end


    if isfield(fitOptions,'resultsDir')
        if ~exist(fitOptions.resultsDir,'dir')
            mkdir(fitOptions.resultsDir)
        end
        resultsFileStem = sprintf('%s/%s',fitOptions.resultsDir,resultsFileStem);
    end
    
    % Import the ODE data we're trying to match
    odeData = load(fitOptions.odeFile);
    nT = length(odeData.timeVec)-1;
    tStart = odeData.timeVec(1);
    tEnd = odeData.timeVec(end);
    
    % Check and set our fitting nT (for internal simulations)
    if ~isfield(fitOptions,'nTFit')
        warning('nTFit not specified. Fitting to ODE data nT=%d.',nT)
        fitOptions.nTFit = nT;
    end
    if isempty(fitOptions.nTFit)
        fitOptions.nTFit = nT;
    end
    
    
    % Fill in the ODE STM
    odeData.STM = modelStruct.S;
    
    % If we split reversible fluxes in the FBA model, split them in the flux data matrix as well
    if size(odeData.STM,2) > size(odeData.fluxMatrix,2)
        odeData = splitOdeDataReversible(odeData);
    end
    
    % Estimate derivatives for pooling flux terms
    odeData.vBounds = modelStruct.vBounds;
    
    % Placeholders for pooling fluxes
    odeData.fluxMatrix(:,end+1:end+size(odeData.concMatrix,2)) = nan;

    % Now figure out which fluxes are 'fixed' at UB=LB
    odeData.fixedFluxes = (odeData.vBounds(:,1)==odeData.vBounds(:,2));
    for k = find(odeData.fixedFluxes)'
        odeData.fluxMatrix(:,k) = odeData.vBounds(k,1);
    end
    
    
    % Begin pre-processing
    fprintf('\tPre-processing... ')
    ticStart = tic;
    [processedTimeVec, processedConcMatrix, processedFluxMatrix] = processToFittingData(odeData, fitOptions.nTFit, fitOptions.fitPreprocessScheme, missingX);
    runTime = toc(ticStart);
    
    
    % Begin parameter fitting
    fprintf('%04g sec\n',runTime)
    
    for fitString = fitStringList 
        switch fitString{1}
        case 'GA'

            % Fit the data to FBA
            fprintf('\tFitting FBA-GA... ')     
            fitOptionGA = fitOptions;
            fitOptionGA.solverType = 'ga';
            fitOptionGA.nTries = 1;

            ticStart = tic;
            [optimalParams,solverStatus,solverPopulation] = fitLKDFBA(processedTimeVec,processedConcMatrix,processedFluxMatrix,modelStruct,fitnessWeightVector(:)',fitOptionGA);
            runTime = toc(ticStart);
            fprintf('%04g sec\n',runTime)

            % Save the results out
            save(sprintf('%s%s_fbaGaParams.mat',resultsFileStem,suffix),...
                'tStart', 'tEnd', 'optimalParams','runTime','fitOptions','modelStruct','fitnessWeightVector','solverStatus','solverPopulation');

            clear ticStart optimalParams solverStatus solverPopulation runTime
            

        case 'LR'

            % Fit the data to FBA
            fprintf('\tFitting FBA-LR...  ')
            fitOptionR = fitOptions;
            fitOptionR.solverType = 'fminsearch';
            fitOptionR.nTries = 0;
            fitOptionR.fixedParameterSequence = zeros(size(fitOptionR.fixedParameterSequence,1),1);
            if isfield(fitOptionR,'seedParameters') 
                fitOptionR = rmfield(fitOptionR,'seedParameters');
            end
            
            ticStart = tic;
            [optimalParams,solverStatus,solverPopulation] = fitLKDFBA(processedTimeVec,processedConcMatrix,processedFluxMatrix,modelStruct,fitnessWeightVector(:)',fitOptionR);
            runTime = toc(ticStart);
            fprintf('%04g sec\n',runTime)

            % Save the results out
            save(sprintf('%s%s_fbaRegressionParams.mat',resultsFileStem,suffix),...
                'tStart', 'tEnd', 'optimalParams','runTime','fitOptions','modelStruct','fitnessWeightVector','solverStatus','solverPopulation');

            clear ticStart optimalParams solverStatus solverPopulation runTime 

            
        case 'LR+'

            % Fit the data to FBA
            fprintf('\tFitting FBA-LR+... ')
            fitOptionRp = fitOptions;
            fitOptionRp.solverType = 'fminsearch';

            ticStart = tic;
            [optimalParams,solverStatus,solverPopulation] = fitLKDFBA(processedTimeVec,processedConcMatrix,processedFluxMatrix,modelStruct,fitnessWeightVector(:)',fitOptionRp);
            runTime = toc(ticStart);
            fprintf('%04g sec\n',runTime)

            % Save the results out
            save(sprintf('%s%s_fbaRegressionPlusParams.mat',resultsFileStem,suffix),...
                'tStart', 'tEnd', 'optimalParams','runTime','fitOptions','modelStruct','fitnessWeightVector','solverStatus','solverPopulation');

            clear ticStart optimalParams solverStatus solverPopulation runTime
           
        otherwise
            fprintf('\tInvalid fitting choice, ''%s''\n',fitString)
        end
    end
end
