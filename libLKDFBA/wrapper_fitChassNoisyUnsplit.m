function wrapper_fitChassNoisyUnsplit(fileName,fitStringList)
    
    % Specify directories and names for file I/O 
    odeDataDir = 'chassDataV';
    seriesName = sprintf('Chass Noisy Unsplit');
    
    % Are we separating out efflux controls? This makes for a lot of params
    fitOptions.separateParams = false;

    % Script to initialize other default fitting parameter
    setFitParamsChass

    % T/F: Using the fixed glucose data set?
    % If not, we indicate the variable external glucose data/model.
    fitOptions.glcFixed = false;

    % What is the FBA objective?
    % 1) PDH only
    % 2) PDH plus other effluxes
    fitOptions.chassObjectiveOpt = 2;

    % Which flux estimation scheme are we using?
    % 0) Defaults to original data, but no suffix added to file name
    % 1) Original concentration and flux data from data set
    % 2) Smoothed concentrations with original flux data
    % 3) Original concentrations with fluxs from smoothing & backslash
    fitOptions.fitPreprocessScheme = 0; 

    % T/F: Use a hueristic to modify objective weights on metabolite terms?
    % weights = ||errorVector(1:nMetabs)./(range(odeConcMatrix,1).^2)||
    fitOptions.useHeuristicWeights = true;
    % If we use a heuristic, we can just set these as empty
    fitOptions.metaboliteWeights = [];
    fitOptions.allWeights = [];

    % Are we setting the efflux constraints from '<' to '='?
    % (This has a high chance of overconstraining the system)
	fitOptions.setEqualityEffluxes = false;

    % Are we displaying intermediate fitting progress?
    fitOptions.gaDisplay = 'iter';
    fitOptions.gaDisplay = 'off';

    % This defines the parameter fitting sequence
    % This is set up to loop through one pair of parameters at a time
    % We're going to loop through nRounds times total
    nRounds = 2;
	fixedParameterSequence = [];
	for j = 1:nRounds
	    for i = [1:6, 24:nRegs]
	        fixedParameterSequence(:,end+1) = ones(nRegs,1);
	        fixedParameterSequence(i,end) = 0;
	    end
	end
    fixedParameterSequence(7:23,:) = 1; % Fix the degradation/dilution kinetic rate constants
	fitOptions.fixedParameterSequence = fixedParameterSequence;
    
    % Set up a few more I/O things
    fitOptions.odeFile = sprintf('%s/%s',odeDataDir,fileName);
    fitOptions.seriesName = seriesName;
    
    % Make sure we have a directory in place to save results
    if ~isfield(fitOptions,'resultsDir')
        fitOptions.resultsDir = 'results_unsplit';
    end
    
    % Make sure the FBA model will know if we're doing pooled or split
    % regulation parameter mode
    if isfield(fitOptions,'separateParams')
        modelStruct.separateParams = fitOptions.separateParams;
    end
    
    % Load the FBA model structure
    if isfield(fitOptions,'glcFixed') && fitOptions.glcFixed
        setLkdfbaParamsChassFixedGlc;
    else
        setLkdfbaParamsChassVariableGlc;
    end
    
    % Overwrite the FBA objective according to our setting
    if isfield(fitOptions,'chassObjectiveOpt')
        if fitOptions.chassObjectiveOpt == 1
            modelStruct.objectiveFluxIndex = 25;
        elseif fitOptions.chassObjectiveOpt == 2
            modelStruct.objectiveFluxIndex = [15, 17, 21, 22, 23, 25, 30, 31];
        end
    end
    
    % We're not allowing missing values in this wrapper function
    missingX = zeros(18,1);
    
    % Filename for current fit results
    if ~isfield(fitOptions,'resultsFileStem')
        fitOptions.resultsFileStem = sprintf('%s',fileName(1:end-4));
    end

    % Finally: Perform the parameter fitting procedure
    fprintf('Fitting %s...\n',fitOptions.odeFile)
    fitChass(modelStruct,fitOptions,fitStringList,missingX,fitOptions.resultsFileStem)

end
