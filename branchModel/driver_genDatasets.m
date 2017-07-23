clc; clear; close all;

dataDir = 'branchData';

% 1) generate my hi-res datasets: see getParamsVecNum.m for param vals
nTotal = 15;

for k = 1:nTotal
    
    datasetNames{k} = wrapper_genOdeData(k,dataDir);
    
end

% % break
% 2) Generate my noisy datasets, over various nT and CoV combinations
nTList = [15 20 30 40 50];
covList = [0.05 0.15 0.25];
numSets = 50;

% % nTList = [15 50];
% % covList = [0.05 0.15 0.25];
% % numSets = 2;

% a. Get the hi-res dataset file name
hiResDataFileName = ['branchData/branch_k-01_hiRes.mat'];

% b. Loop nT values
for nT = nTList

    % c. Loop CoV Values
    for cov = covList
        % Generate my noisy datasets
        wrapper_genNoisyData(hiResDataFileName,nT,cov,numSets)
    end
end
    
