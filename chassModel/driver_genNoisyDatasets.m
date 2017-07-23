clc; clear; close all;

nTList = [20 30 40];
covList = [0.1 0.2];
numSets = 20;

% a. Get the hi-res dataset file name
hiResDataFileName = 'chassDataV/chassV_hiRes.mat';

% b. Loop nT values
for nT = nTList

    % c. Loop CoV Values
    for cov = covList
        % Generate my noisy datasets
        genNoisyDataChass(hiResDataFileName,nT,cov,numSets)
    end
end
    
