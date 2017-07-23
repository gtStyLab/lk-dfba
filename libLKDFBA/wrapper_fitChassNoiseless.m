function wrapper_fitChassNoiseless(fileName,fitStringList,fitOptions)
    
    % Specify directories and names for file I/O 
    odeDataDir = '.';
    seriesName = sprintf('Chass Noiseless');
    
    % if needed: load the default fit options structure
    if ~exist('fitOptions','var') || isempty(fitOptions)
        setFitParamsChass;
    end
    
    fitOptions.odeFile = sprintf('%s/%s',odeDataDir,fileName);
    fitOptions.seriesName = seriesName;
    
    if ~isfield(fitOptions,'resultsDir')
        fitOptions.resultsDir = 'results';
    end
    
    if isfield(fitOptions,'separateParams')
        modelStruct.separateParams = fitOptions.separateParams;
    end
    
    % Load the FBA model structure
    if isfield(fitOptions,'glcFixed') && fitOptions.glcFixed
        setLkdfbaParamsChassFixedGlc;
    else
        setLkdfbaParamsChassVariableGlc;
    end
    
    if isfield(fitOptions,'chassObjectiveOpt')
        if fitOptions.chassObjectiveOpt == 1
            modelStruct.objectiveFluxIndex = 25;
        elseif fitOptions.chassObjectiveOpt == 2
            modelStruct.objectiveFluxIndex = [15, 17, 21, 22, 23, 25, 30, 31];
        end
    end
    
    missingX = zeros(18,1);
    
    % Filename for current fit results
    if ~isfield(fitOptions,'resultsFileStem')
        fitOptions.resultsFileStem = sprintf('%s',fileName(1:end-4));
    end

    % Process and fit
    fprintf('Fitting %s...\n',fitOptions.odeFile)
    fitChass(modelStruct,fitOptions,fitStringList,missingX,fitOptions.resultsFileStem)

end
