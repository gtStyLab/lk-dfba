function wrapper_fitBranchNoiseless(fileName,fitStringList,nTFit)
    
    if ~exist('nTFit','var')
        nTFit = 100;
    end
    
    seriesName = 'fitBranch_noiseless';
    fitPreprocessScheme = 0; % Interpolation only, no suffix
    odeDataDir = 'branchData';
    resultsDir = 'results';
    odeFile = sprintf('%s/%s',odeDataDir,fileName);
    fprintf('Fitting %s...\n',odeFile)

    resultsFileStem = fileName(1:end-4);
    
    fitBranch(odeFile,resultsDir,resultsFileStem,nTFit,fitStringList,fitPreprocessScheme,[],seriesName)

end
