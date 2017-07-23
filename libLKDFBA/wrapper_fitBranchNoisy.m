function wrapper_fitBranchNoisy(fileName,fitPreprocessScheme,fitStringList,missingX)
    
    % Fit test cases!
    seriesName = 'fit_branch_noisy';
    odeDataDir = 'branchData';
    resultsDir = 'results';
    odeFile = sprintf('%s/%s',odeDataDir,fileName);
    fprintf('Fitting %s...\n',odeFile)

    resultsFileStem = fileName(1:end-4);

    fitBranch(odeFile,resultsDir,resultsFileStem,[],fitStringList,fitPreprocessScheme,[],seriesName)

end
