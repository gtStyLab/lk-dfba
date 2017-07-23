fclose('all'); close; clear; clc;

resultsDir = 'results';

genMatlab = 1;
    matlabCommandFileName = 'driver_runJobs_matlab_hiRes.m';
genPBS = 0;
    commandListFileName = 'driver_runJobs_PBS_hiRes.sh';

queueString = 'queueName';

% tString= 'dd:hh:mm:ss';
tString1 = '00:12:00:00';
tString2 = '00:24:00:00';

loadFileNameListBranchHiRes

k=1;
jobStruct = struct('fileName',[],'jobName',[],'queueString',[],'tString',[],'commandString',[]);


% Jobs for fitBranchNoisy
for i = 1:length(fileNameList)
     for stringList = {'MM','BST','LR','LR+','GA'};
         
        resultsFileName = [];
         
        if strcmp(stringList{1},'BST')
            resultsFileName = sprintf('%s/%s_BstParams.mat',resultsDir,fileNameList{i}(1:end-4));
        elseif strcmp(stringList{1},'MM')
            resultsFileName = sprintf('%s/%s_MmParams.mat',resultsDir,fileNameList{i}(1:end-4));
        elseif strcmp(stringList{1},'GA')
            resultsFileName = sprintf('%s/%s_fbaGaParams.mat',resultsDir,fileNameList{i}(1:end-4));
        elseif strcmp(stringList{1},'LR')
            resultsFileName = sprintf('%s/%s_fbaRegressionParams.mat',resultsDir,fileNameList{i}(1:end-4));
        elseif strcmp(stringList{1},'LR+')
            resultsFileName = sprintf('%s/%s_fbaRegressionPlusParams.mat',resultsDir,fileNameList{i}(1:end-4));
        end
        
        if ~exist(resultsFileName,'file')
            jobStruct(k).fileName = sprintf('runJob_%s_hiRes_%s.txt',fileNameList{i}(1:end-4),stringList{1});
            jobStruct(k).jobName = sprintf('%s_hiRes_%s',fileNameList{i}(1:end-4),stringList{1});
            jobStruct(k).queueString = queueString;
            jobStruct(k).tString = tString1;
            jobStruct(k).commandString = sprintf('wrapper_fitBranchNoiseless(''%s'',{''%s''})',fileNameList{i},stringList{1});
            k=k+1;
        end    
    end
end

if genMatlab, genScript_rerunJobsMatlab, end
if genPBS, genScript_rerunJobsPBS, end

