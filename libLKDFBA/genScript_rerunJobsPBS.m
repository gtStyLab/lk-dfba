% This script generates a set of PBS server queue jobs and a file to submit
% them automatically using qsub. This script is designed to be called by
% another script specifying the list of fits in the structure jobStruct.

if ~exist('commandListFileName','var')
    commandListFileName = 'driver_runJobs_PBS.sh';
end

if ~exist('sleepTime','var')
    sleepTime = 60;
end

fclose('all');
jobListFile = fopen(commandListFileName,'w');

if ~isempty(jobStruct(1).fileName)
    for k = 1:length(jobStruct)

        jobFileName = jobStruct(k).fileName; 
        jobFile = fopen(jobFileName,'w');

        fprintf(jobFile, '#PBS -N %s\n#PBS -q %s\n#PBS -l walltime=%s\n#PBS -l nodes=1:ppn=1\n#PBS -m be\n#PBS -j oe\n#PBS -o pacejob.$PBS_JOBID.txt\n\nmodule unload matlab/r2012a\nmodule load matlab/r2016a\nmodule load gurobi/7.0.1\n\ncd $PBS_O_WORKDIR\n\necho "MATLAB Command: %s"\n\nmatlab -nojvm -nosplash -nodisplay -singleCompThread -r "%s"\n',jobStruct(k).jobName, jobStruct(k).queueString, jobStruct(k).tString, jobStruct(k).commandString, jobStruct(k).commandString);
        fclose(jobFile);

        % Add job to list of qsub commands
        fprintf(jobListFile,'qsub %s\n',jobFileName);
        fprintf(jobListFile,'rm %s\n',jobFileName);
        fprintf(jobListFile,'sleep %d\n\n',sleepTime);

    end
end

fclose(jobListFile);

system(sprintf('chmod +x %s',commandListFileName));
