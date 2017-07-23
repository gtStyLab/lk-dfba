fclose('all'); close; clear; clc;

odeDataDir = 'chassDataV';
resultsDir = 'results_split';

loadFileNameList_chassNoisy

genMatlab = 1;
    matlabCommandFileName = 'driver_runAllChassFits_matlab_split.m';
genPBS = 0;
    commandListFileName = 'driver_runAllChassFits_PBS_split.sh';

queueString = 'queueName';

% tString= 'dd:hh:mm:ss';
tString1 = '00:06:00:00';



k=1;
jobStruct = struct('fileName',[],'jobName',[],'queueString',[],'tString',[],'commandString',[]);

% Jobs for wrapper_fitChassNoisy
for i = 1:length(fileNameList)

    rFile = sprintf('%s/%s_fbaRegressionParams.mat',resultsDir,fileNameList{i}(1:end-4));

    if ~exist(rFile,'file')
        jobStruct(k).fileName = sprintf('runJob_%s.txt',fileNameList{i}(1:end-4));
        jobStruct(k).jobName = sprintf('fit_%s',fileNameList{i}(1:end-4));
        jobStruct(k).queueString = queueString;
        jobStruct(k).tString = tString1;
        jobStruct(k).commandString = sprintf('wrapper_fitChassNoisySplit(''%s'',{''LR''})',fileNameList{i});
        k=k+1;
    end
end

for i = 1:length(fileNameList)

    rFile = sprintf('%s/%s_fbaRegressionPlusParams.mat',resultsDir,fileNameList{i}(1:end-4));

    if ~exist(rFile,'file')
        jobStruct(k).fileName = sprintf('runJob_%s.txt',fileNameList{i}(1:end-4));
        jobStruct(k).jobName = sprintf('fit_%s',fileNameList{i}(1:end-4));
        jobStruct(k).queueString = queueString;
        jobStruct(k).tString = tString1;
        jobStruct(k).commandString = sprintf('wrapper_fitChassNoisySplit(''%s'',{''LR+''})',fileNameList{i});
        k=k+1;
    end
end

if genMatlab, genScript_rerunJobsMatlab, end
if genPBS, genScript_rerunJobsPBS, end

