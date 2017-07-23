close all; fclose('all'); clear; clc; 

% File IO settings
odeFileOutStem =  'chassF';
odeFileIn = 'chass_copasiOutput_fixedGlc.txt';
stmFile = 'STM.txt';


dataStruct = importdata(odeFileIn);
    timeVec = dataStruct.data(:,1);
    fluxTimeVec = timeVec;
    concMatrix = dataStruct.data(:,2:19);
    concNames = dataStruct.colheaders(2:19)';
    fluxMatrix = dataStruct.data(:,20:67);
    fluxNames = dataStruct.colheaders(20:67)';
    % Remove some cruft from Copasi naming output
    for i = 1:length(fluxNames)
        fluxNames{i} = fluxNames{i}(2:end-6);
    end
    
    

% Rows of STM are species, columns are fluxes
stmStruct = importdata(stmFile);
    % STM is in a different order than my other data file...    
    rowList = [18,5,3,16,4,6,15,7,13,1,2,14,8,11,17,9,10,12];
    % Re-order reactions as well
    colList = [48,1:39,44,45,40,42,43,41,46,47];
    stm = sparse(stmStruct.data(rowList,colList));
    % Diagnostic: check against concNames and fluxNames
    fluxNamesCheck = stmStruct.textdata(1,colList+1)';
    concNamesCheck = stmStruct.textdata(rowList+1,1);

    save('chassSTM.mat','stm');
    
    
% 1. Save the smooth, full versiontIdx = 1:10:2001;
tIdx = 1:10:10001;

timeVec = timeVec(tIdx);
fluxTimeVec = fluxTimeVec(tIdx);
concMatrix = concMatrix(tIdx,:);
fluxMatrix = fluxMatrix(tIdx,:);

tStart = timeVec(1);
tEnd = timeVec(end);
nT = length(timeVec) - 1;

plotColor = 'k';
seriesName = 'Chass ODE, Full Data, 0-10s';

save(sprintf('%s_hiRes.mat',odeFileOutStem),...
        'concMatrix',...
        'fluxMatrix',...
        'timeVec',...
        'fluxTimeVec',...
        'tStart',...
        'tEnd',...
        'nT',...
        'concNames',...
        'fluxNames',...
        'plotColor',...
        'seriesName');
 
    
    