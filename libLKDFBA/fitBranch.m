function fitBranch(odeFile,resultsDir,resultsFileStem,nTFit,fitStringList,fitPreprocessScheme,missingX,seriesName)
% This funcion performs the parameter fitting job specified by the
% arguments for the branched pathway model. The resulting optimal
% parameters are saved directly to .mat file specified by the arguments.
%
% odeFile is a string specifying the name of the time course data file
% which is to be fit. This can be noiseless or noisy data.
%
% resultsDir is a string specifying to directory to which the fitted output
% is to be written.
%
% resultsFileStem is a string specifying the base filename for the results.
% Additional suffixes corresponding to the preprocessing and fitting
% methods used in the fit are automatically appended to this string.
%
% nTFit is an integer specifying the value of nT at which LK-DFBA models
% should be solved during parameter. This number should be high enough to
% ensure that the LK-DFBA optimization produces a consistent time course.
%
% fitStringList is a cell array of strings specifying fitting methods.
% Valid values in this list are 'BST', 'MM', 'GA', 'LR', and 'LR+'. If only
% one fit is to be performed, then fitStringList must still be a cell
% array, e.g. fitStringList = {'LR+'}.
%
% fitPreprocessScheme is a value of [1, 2, 3, 4] corresponding to the
% following combinations of data smoothing and dynamic flux estimation:
%    1. Specifies that the data from odeFile should be used for both
%       concentrations and fluxes, allowing only interpolation if needed.
%    2. Concentration data fot fitting is smoothed using the impulse
%       function as specified by Dromms and Styczynski (2015), while flux
%       data is used directly from odeFile.
%    3. Concentration data is smoothed and used for DFE to determine flux
%       time course values passed to the fitting step. The original
%       concentration time course values from odeFile are also passed to
%       the fitting steps.
%
% missingX is a boolean vector whose length is equal to the number of
% metabolites in the system. By default, all values in missingX are false,
% indicating that no metabolite concentration time course profiles are to
% be witheld from parameter fitting as a 'missing' metabolite. When an
% entry is set to true, only the initial condition is supplied to the
% parameter fitting steps and the metabolite is barred from varying by
% setting the pooling flux as 'static' (i.e., 0) for DFE and LK-DFBA.
%
% seriesName is a string specifying a label describing the fitting task
% that is being performed. This is primarily offered as a method of
% identification when looking at multiple, similarly-named results files.
%
% Written by R.A. Dromms 2016-07-07



    % Default fitting weights: Concentrations only
    fitnessWeightVector = [1 1 1 1 1 0 0 0 0 0 0 0 0 0 0];
    % If we're missing metabolites, don't fit to that data!
    fitnessWeightVector(find(missingX)) = 0;
    
    switch fitPreprocessScheme
        case 1
            suffix = '_noPreprocess';
        case 2
            suffix = '_smoothed';
        case 3
            if exist('missingX','var') && ~isempty(missingX)
                suffix = sprintf('_smoothedBackslash_missing_%d%d%d%d%d',missingX(1),missingX(2),missingX(3),missingX(4),missingX(5));
            else
                suffix = '_smoothedBackslash';
                missingX = zeros(5,1);
            end
        otherwise
            fitPreprocessScheme = 1;
            suffix = '';
    end
        

    % Generate default modelStruct structure
    setLkdfbaParamsBranch
    
    % Generate default fitOptions structure
    setFitParamsBranch
    
    if exist('resultsDir','var')
        if ~exist(resultsDir,'dir')
            mkdir(resultsDir)
        end
    % %     resultsFileStem = sprintf('%s/%s_%s',resultsDir,resultsFileStem,datestr(now,'yyyy.mm.dd-HH.MM.SS'));
        resultsFileStem = sprintf('%s/%s',resultsDir,resultsFileStem);
    end
    
    
    % Import the ODE data we're trying to match
    odeData = load(odeFile);
    nT = length(odeData.timeVec)-1;
    tStart = odeData.timeVec(1);
    tEnd = odeData.timeVec(end);
    
    % Check and set our fitting nT (for internal simulations)
    if ~exist('nTFit','var')
        warning('nTFit not specified. Fitting to ODE data nT=%d.',nT)
        nTFit = nT;
    end
    
    if isempty(nTFit)
        nTFit = nT;
    end
    
    
    % Override default stoichiometry
    modelStruct.S(3,5) = -odeData.paramsVec(1);
    modelStruct.S(4,5) = -odeData.paramsVec(2);
    
    odeData.vBounds = modelStruct.vBounds;
    odeData.STM = modelStruct.S;
    odeData.fixedFluxes = (odeData.vBounds(:,1)==odeData.vBounds(:,2));
    
    fprintf('\tPre-processing... ')
    ticStart = tic;
    [processedTimeVec, processedConcMatrix, processedFluxMatrix] = processToFittingData(odeData, nTFit, fitPreprocessScheme, missingX);
    runTime = toc(ticStart);
    fprintf('%04g sec\n',runTime)
    
    
    for fitString = fitStringList 
        switch fitString{1}
        case 'GA'

            % Fit the data to FBA
            fprintf('\tFitting FBA-GA... ')
            fitOptionsG = fitOptions;
            fitOptionsG.solverType = 'ga';
            fitOptionsG.nTries = 1;
            fitOptionsG.fixedParameterSequence = [0,0,0,0,0,0;]';

            ticStart = tic;
            [optimalParams,solverStatus,~] = fitLKDFBA(processedTimeVec,processedConcMatrix,processedFluxMatrix,modelStruct,fitnessWeightVector(:)',fitOptionsG);
            runTime = toc(ticStart);
            fprintf('%04g sec\n',runTime)

            % Save the results out
            save(sprintf('%s%s_fbaGaParams.mat',resultsFileStem,suffix),...
                'tStart', 'tEnd', 'optimalParams','runTime','odeFile','seriesName','nTFit','fitOptions','modelStruct','fitnessWeightVector','solverStatus');

            clear ticStart optimalParams solverStatus solverPopulation runTime

        case 'LR'

            % Fit the data to FBA
            fprintf('\tFitting FBA-LR...  ')
            fitOptionsR = fitOptions;
            fitOptionsR.solverType = 'fminsearch';
            fitOptionsR.nTries = 0;
            fitOptionsR.fixedParameterSequence = [];

            ticStart = tic;
            [optimalParams,solverStatus,~] = fitLKDFBA(processedTimeVec,processedConcMatrix,processedFluxMatrix,modelStruct,fitnessWeightVector(:)',fitOptionsR);
            runTime = toc(ticStart);
            fprintf('%04g sec\n',runTime)

            % Save the results out
            save(sprintf('%s%s_fbaRegressionParams.mat',resultsFileStem,suffix),...
                'tStart', 'tEnd', 'optimalParams','runTime','odeFile','seriesName','nTFit','fitOptions','modelStruct','fitnessWeightVector','solverStatus');

            clear ticStart optimalParams solverStatus solverPopulation runTime


        case 'LR+'

            % Fit the data to FBA
            fprintf('\tFitting FBA-LR+... ')
            fitOptionsRp = fitOptions;
            fitOptionsRp.solverType = 'fminsearch';

            ticStart = tic;
            [optimalParams,solverStatus,solverPopulation] = fitLKDFBA(processedTimeVec,processedConcMatrix,processedFluxMatrix,modelStruct,fitnessWeightVector(:)',fitOptionsRp);
            runTime = toc(ticStart);
            fprintf('%04g sec\n',runTime)

            % Save the results out
            save(sprintf('%s%s_fbaRegressionPlusParams.mat',resultsFileStem,suffix),...
                'tStart', 'tEnd', 'optimalParams','runTime','odeFile','seriesName','nTFit','fitOptions','modelStruct','fitnessWeightVector','solverStatus','solverPopulation');

            clear ticStart optimalParams solverStatus solverPopulation runTime
            

        case 'BST'

            % Fit the data to BST
            fprintf('\tFitting BST...    ')
                           % [ a2; b21; a3; b32; b3r4; a4; b41; b4r3; a5; b53; b54;]
            paramBoundsBst = [  0    0    0    0    0    0    0 -inf    0    0    0; ...
                              inf  inf  inf  inf  inf  inf  inf    0  inf  inf  inf]';
            ticStart = tic;
            optimalParams = fitBstBranch(processedTimeVec,processedConcMatrix,processedFluxMatrix,fitnessWeightVector,odeData.paramsVec(1:2,1),paramBoundsBst);
            solverStatus = 'Success';
            runTime = toc(ticStart);
            fprintf('%04g sec\n',runTime)

            % Save the results out
            save(sprintf('%s%s_BstParams.mat',resultsFileStem,suffix),...
                'tStart', 'tEnd', 'optimalParams','runTime','odeFile','seriesName','nTFit','fitOptions','modelStruct','fitnessWeightVector','solverStatus');

            clear ticStart optimalParams solverStatus solverPopulation runTime
            

        case 'MM'

            % Fit the data to MM
            fprintf('\tFitting MM...     ')
            ticStart = tic;
            optimalParams = fitMmBranch(processedTimeVec,processedConcMatrix,processedFluxMatrix,fitnessWeightVector,odeData.paramsVec(1:2,1));
            solverStatus = 'Success';
            runTime = toc(ticStart);
            fprintf('%04g sec\n',runTime)

            % Save the results out
            save(sprintf('%s%s_MmParams.mat',resultsFileStem,suffix),...
                'tStart', 'tEnd', 'optimalParams','runTime','odeFile','seriesName','nTFit','fitOptions','modelStruct','fitnessWeightVector','solverStatus');

            clear ticStart optimalParams solverStatus solverPopulation runTime
            

        otherwise
            fprintf('\tInvalid fitting choice, ''%s''\n',fitString)
        end
    end
end
