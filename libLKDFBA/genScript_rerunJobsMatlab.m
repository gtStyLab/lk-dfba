% This script generates a MATLAB script with calls to a wrapper function.
% Running this script will perform the parameter fits specified. This
% script is designed to be called by another script specifying the list of
% fits in the structure jobStruct.

if ~exist('matlabCommandFileName','var')
    matlabCommandFileName = 'driver_runJobs_matlab.m';
end

fclose('all');
matlabCommandScript = fopen(matlabCommandFileName,'w');
fprintf(matlabCommandScript,'fclose(''all''); close; clear; clc;\n\n');

for k =1:length(jobStruct)
    fprintf(matlabCommandScript,'%s\n',jobStruct(k).commandString);
end    

fprintf(matlabCommandScript,'\n');
fclose(matlabCommandScript);
