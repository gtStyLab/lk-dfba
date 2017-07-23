fclose('all'); close; clear; clc;

resultsDir = 'results';

genMatlab = 1;
    matlabCommandFileName = 'driver_runJobs_matlab_noisy.m';
genPBS = 0;
    commandListFileName = 'driver_runJobs_PBS_noisy.sh';

genNoisy = 0;
genSmoothed = 0;
genBackslash = 1;
genMissing = 1;


% % queueString = 'queueName';

% tString= 'dd:hh:mm:ss';
tString1 = '00:00:30:00';
tString2 = '00:02:00:00';



loadFileNameListBranchNoisy

stringList2 = {'BST','MM','LR','LR+'};
k=1;
jobStruct = struct('fileName',[],'jobName',[],'queueString',[],'tString',[],'commandString',[]);


% Jobs for BranchNoisy
if genNoisy
    for i = 1:length(fileNameList)
        for stringList = stringList2

            resultsFileName = [];

            if strcmp(stringList{1},'BST')
                resultsFileName = sprintf('%s/%s_noisy_BstParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'MM')
                resultsFileName = sprintf('%s/%s_noisy_MmParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'GA')
                resultsFileName = sprintf('%s/%s_noisy_fbaGaParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'LR')
                resultsFileName = sprintf('%s/%s_noisy_fbaRegressionParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'LR+')
                resultsFileName = sprintf('%s/%s_noisy_fbaRegressionPlusParams.mat',resultsDir,fileNameList{i}(1:end-4));
            end

            if ~exist(resultsFileName,'file')
                jobStruct(k).fileName = sprintf('runJob_%s_noisy_%s.txt',fileNameList{i}(1:end-4),stringList{1});
                jobStruct(k).jobName = sprintf('fit_%s_noisy_%s',fileNameList{i}(1:end-4),stringList{1});
                jobStruct(k).queueString = queueString;
                jobStruct(k).tString = tString1;
                jobStruct(k).commandString = sprintf('wrapper_fitBranchNoisy(''%s'',1,{''%s''},[])',fileNameList{i},stringList{1});
                k=k+1;
            end
        end
    end
end


% Jobs for BranchNoisySmoothed
if genSmoothed
    for i = 1:length(fileNameList)
        for stringList = stringList2
        
            resultsFileName = [];

            if strcmp(stringList{1},'BST')
                resultsFileName = sprintf('%s/%s_smoothed_BstParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'MM')
                resultsFileName = sprintf('%s/%s_smoothed_MmParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'GA')
                resultsFileName = sprintf('%s/%s_smoothed_fbaGaParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'LR')
                resultsFileName = sprintf('%s/%s_smoothed_fbaRegressionParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'LR+')
                resultsFileName = sprintf('%s/%s_smoothed_fbaRegressionPlusParams.mat',resultsDir,fileNameList{i}(1:end-4));
            end

            if ~exist(resultsFileName,'file')

                jobStruct(k).fileName = sprintf('runJob_%s_noisySmoothed_%s.txt',fileNameList{i}(1:end-4),stringList{1});
                jobStruct(k).jobName = sprintf('fit_%s_smoothed_%s',fileNameList{i}(1:end-4),stringList{1});
                jobStruct(k).queueString = queueString;
                jobStruct(k).tString = tString1;
                jobStruct(k).commandString = sprintf('wrapper_fitBranchNoisy(''%s'',2,{''%s''},[])',fileNameList{i},stringList{1});
                k=k+1;
            end
        end
    end
end


% Jobs for BranchNoisySmoothedBackslash
if genBackslash
    for i = 1:length(fileNameList)
        for stringList = stringList2
        
            resultsFileName = [];

            if strcmp(stringList{1},'BST')
                resultsFileName = sprintf('%s/%s_smoothedBackslash_BstParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'MM')
                resultsFileName = sprintf('%s/%s_smoothedBackslash_MmParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'GA')
                resultsFileName = sprintf('%s/%s_smoothedBackslash_fbaGaParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'LR')
                resultsFileName = sprintf('%s/%s_smoothedBackslash_fbaRegressionParams.mat',resultsDir,fileNameList{i}(1:end-4));
            elseif strcmp(stringList{1},'LR+')
                resultsFileName = sprintf('%s/%s_smoothedBackslash_fbaRegressionPlusParams.mat',resultsDir,fileNameList{i}(1:end-4));
            end

            if ~exist(resultsFileName,'file')
                jobStruct(k).fileName = sprintf('runJob_%s_smoothBackslash_%s.txt',fileNameList{i}(1:end-4),stringList{1});
                jobStruct(k).jobName = sprintf('fit_%s_backslashFba_%s',fileNameList{i}(1:end-4),stringList{1});
                jobStruct(k).queueString = queueString;
                jobStruct(k).tString = tString1;
                jobStruct(k).commandString = sprintf('wrapper_fitBranchNoisy(''%s'',3,{''%s''},[])',fileNameList{i},stringList{1});
                k=k+1;
            end
        end
    end
end

% Jobs for BranchNoisySmoothedBackslashMissing
if genMissing
    missingXList = [1,0,0,0,0;
                    0,1,0,0,0;
                    0,0,1,0,0;
                    0,0,0,1,0;
                    0,0,0,0,1;
                    ]';

    for i = 1:length(fileNameList)
        for missingX = missingXList
            for stringList = stringList2
            
                resultsFileName = [];

                if strcmp(stringList{1},'BST')
                    resultsFileName = sprintf('%s/%s_smoothedBackslash_missing_%d%d%d%d%d_BstParams.mat',resultsDir,fileNameList{i}(1:end-4),missingX(1),missingX(2),missingX(3),missingX(4),missingX(5));
                elseif strcmp(stringList{1},'MM')
                    resultsFileName = sprintf('%s/%s_smoothedBackslash_missing_%d%d%d%d%d_MmParams.mat',resultsDir,fileNameList{i}(1:end-4),missingX(1),missingX(2),missingX(3),missingX(4),missingX(5));
                elseif strcmp(stringList{1},'GA')
                    resultsFileName = sprintf('%s/%s_smoothedBackslash_missing_%d%d%d%d%d_fbaGaParams.mat',resultsDir,fileNameList{i}(1:end-4),missingX(1),missingX(2),missingX(3),missingX(4),missingX(5));
                elseif strcmp(stringList{1},'LR')
                    resultsFileName = sprintf('%s/%s_smoothedBackslash_missing_%d%d%d%d%d_fbaRegressionParams.mat',resultsDir,fileNameList{i}(1:end-4),missingX(1),missingX(2),missingX(3),missingX(4),missingX(5));
                elseif strcmp(stringList{1},'LR+')
                    resultsFileName = sprintf('%s/%s_smoothedBackslash_missing_%d%d%d%d%d_fbaRegressionPlusParams.mat',resultsDir,fileNameList{i}(1:end-4),missingX(1),missingX(2),missingX(3),missingX(4),missingX(5));
                end

                if ~exist(resultsFileName,'file')
                    jobStruct(k).fileName = sprintf('runJob_%s_noisySmoothedMissing_%d%d%d%d%d_%s.txt',fileNameList{i}(1:end-4),missingX(1),missingX(2),missingX(3),missingX(4),missingX(5),stringList{1});
                    jobStruct(k).jobName = sprintf('fit_%s_missing_%d%d%d%d%d_%s',fileNameList{i}(1:end-4),missingX(1),missingX(2),missingX(3),missingX(4),missingX(5),stringList{1});
                    jobStruct(k).queueString = queueString;
                    jobStruct(k).tString = tString2;
                    jobStruct(k).commandString = sprintf('wrapper_fitBranchNoisy(''%s'',3,{''%s''},[%d,%d,%d,%d,%d])',fileNameList{i},stringList{1},missingX(1),missingX(2),missingX(3),missingX(4),missingX(5));
                    k=k+1;
                end
            end 
        end
    end
end


if genMatlab, genScript_rerunJobsMatlab, end
if genPBS, genScript_rerunJobsPBS, end

