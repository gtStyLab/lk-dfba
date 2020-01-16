clc; clear; close all

errorFileName = 'processedError_branch_missing_compact.mat';

stringMatchList{1}  = 'hiRes';                   %  1
stringMatchList{2}  = 'nT-015';                  %  2
stringMatchList{3}  = 'nT-020';                  %  3
stringMatchList{4}  = 'nT-030';                  %  4
stringMatchList{5}  = 'nT-040';                  %  5
stringMatchList{6}  = 'nT-050';                  %  6
stringMatchList{7}  = 'cov-05';                  %  7
stringMatchList{8}  = 'cov-15';                  %  8
stringMatchList{9}  = 'cov-25';                  %  9
stringMatchList{10} = 'noPreprocess';            % 10
stringMatchList{11} = 'smoothed_';               % 11
stringMatchList{12} = 'smoothedBackslash';       % 12
stringMatchList{13} = 'fbaGaParams' ;            % 13
stringMatchList{14} = 'fbaRegressionParams' ;    % 14
stringMatchList{15} = 'fbaRegressionPlusParams'; % 15
stringMatchList{16} = 'BstParams';               % 16
stringMatchList{17} = 'MmParams';                % 17

stringMatchList{18} = 'missing_10000';           % 18
stringMatchList{19} = 'missing_01000';           % 19
stringMatchList{20} = 'missing_00100';           % 20
stringMatchList{21} = 'missing_00010';           % 21
stringMatchList{22} = 'missing_00001';           % 22

stringMatchList{23} = 'odeDataNoisy';            % 23


% R+ vs Bst
tagList = [];

for mIdx = 18:22

    tagList{end+1} = [2, 7, 23];           % nT-015, cov-05, data
    tagList{end+1} = [2, 7, 12, 16, mIdx]; % nT-015, cov-05, BST
    tagList{end+1} = [2, 7, 12, 14, mIdx]; % nT-015, cov-05, R
    tagList{end+1} = [2, 7, 12, 15, mIdx]; % nT-015, cov-05, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [3, 7, 23];           % nT-020, cov-05, data
    tagList{end+1} = [3, 7, 12, 16, mIdx]; % nT-020, cov-05, BST
    tagList{end+1} = [3, 7, 12, 14, mIdx]; % nT-020, cov-05, R
    tagList{end+1} = [3, 7, 12, 15, mIdx]; % nT-020, cov-05, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [4, 7, 23];           % nT-030, cov-05, data
    tagList{end+1} = [4, 7, 12, 16, mIdx]; % nT-030, cov-05, BST
    tagList{end+1} = [4, 7, 12, 14, mIdx]; % nT-030, cov-05, R
    tagList{end+1} = [4, 7, 12, 15, mIdx]; % nT-030, cov-05, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [5, 7, 23];           % nT-040, cov-05, data
    tagList{end+1} = [5, 7, 12, 16, mIdx]; % nT-040, cov-05, BST
    tagList{end+1} = [5, 7, 12, 14, mIdx]; % nT-040, cov-05, R
    tagList{end+1} = [5, 7, 12, 15, mIdx]; % nT-040, cov-05, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [6, 7, 23];           % nT-050, cov-05, data
    tagList{end+1} = [6, 7, 12, 16, mIdx]; % nT-050, cov-05, BST
    tagList{end+1} = [6, 7, 12, 14, mIdx]; % nT-050, cov-05, R
    tagList{end+1} = [6, 7, 12, 15, mIdx]; % nT-050, cov-05, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [2, 8, 23];           % nT-015, cov-15, data
    tagList{end+1} = [2, 8, 12, 16, mIdx]; % nT-015, cov-15, BST
    tagList{end+1} = [2, 8, 12, 14, mIdx]; % nT-015, cov-15, R
    tagList{end+1} = [2, 8, 12, 15, mIdx]; % nT-015, cov-15, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [3, 8, 23];           % nT-020, cov-15, data
    tagList{end+1} = [3, 8, 12, 16, mIdx]; % nT-020, cov-15, BST
    tagList{end+1} = [3, 8, 12, 14, mIdx]; % nT-020, cov-15, R
    tagList{end+1} = [3, 8, 12, 15, mIdx]; % nT-020, cov-15, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [4, 8, 23];           % nT-030, cov-15, data
    tagList{end+1} = [4, 8, 12, 16, mIdx]; % nT-030, cov-15, BST
    tagList{end+1} = [4, 8, 12, 14, mIdx]; % nT-030, cov-15, R
    tagList{end+1} = [4, 8, 12, 15, mIdx]; % nT-030, cov-15, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [5, 8, 23];           % nT-040, cov-15, data
    tagList{end+1} = [5, 8, 12, 16, mIdx]; % nT-040, cov-15, BST
    tagList{end+1} = [5, 8, 12, 14, mIdx]; % nT-040, cov-15, R
    tagList{end+1} = [5, 8, 12, 15, mIdx]; % nT-040, cov-15, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [6, 8, 23];           % nT-050, cov-15, data
    tagList{end+1} = [6, 8, 12, 16, mIdx]; % nT-050, cov-15, BST
    tagList{end+1} = [6, 8, 12, 14, mIdx]; % nT-050, cov-15, R
    tagList{end+1} = [6, 8, 12, 15, mIdx]; % nT-050, cov-15, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [2, 9, 23];           % nT-015, cov-25, data
    tagList{end+1} = [2, 9, 12, 16, mIdx]; % nT-015, cov-25, BST
    tagList{end+1} = [2, 9, 12, 14, mIdx]; % nT-015, cov-25, R
    tagList{end+1} = [2, 9, 12, 15, mIdx]; % nT-015, cov-25, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [3, 9, 23];           % nT-020, cov-25, data
    tagList{end+1} = [3, 9, 12, 16, mIdx]; % nT-020, cov-25, BST
    tagList{end+1} = [3, 9, 12, 14, mIdx]; % nT-020, cov-25, R
    tagList{end+1} = [3, 9, 12, 15, mIdx]; % nT-020, cov-25, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [4, 9, 23];           % nT-030, cov-25, data
    tagList{end+1} = [4, 9, 12, 16, mIdx]; % nT-030, cov-25, BST
    tagList{end+1} = [4, 9, 12, 14, mIdx]; % nT-030, cov-25, R
    tagList{end+1} = [4, 9, 12, 15, mIdx]; % nT-030, cov-25, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [5, 9, 23];           % nT-040, cov-25, data
    tagList{end+1} = [5, 9, 12, 16, mIdx]; % nT-040, cov-25, BST
    tagList{end+1} = [5, 9, 12, 14, mIdx]; % nT-040, cov-25, R
    tagList{end+1} = [5, 9, 12, 15, mIdx]; % nT-040, cov-25, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer

    tagList{end+1} = [6, 9, 23];           % nT-050, cov-25, data
    tagList{end+1} = [6, 9, 12, 16, mIdx]; % nT-050, cov-25, BST
    tagList{end+1} = [6, 9, 12, 14, mIdx]; % nT-050, cov-25, R
    tagList{end+1} = [6, 9, 12, 15, mIdx]; % nT-050, cov-25, R+

    tagList{end+1} = [1,2,3,4,5,6,7,8,9];  % Spacer
    
end



               

               
load(errorFileName);
namesList = {tabulatedCalc(:).fileName}';
matchMatrix = zeros(length(namesList),length(stringMatchList));
               
for j = 1:length(stringMatchList)
    % For each item in stringMatchList, check if namesList contains it
    for i = 1:length(namesList)
       matchMatrix(i,j) = ~isempty(strfind(namesList{i},stringMatchList{j}));
    end
    
end

% Once we have this, we can worry about processing the errors (averaging
% etc) and producing the actual plots, by only looking at the intersection
% of the conditions we want to compare (labled with the corresponding
% string ID in stringMatchList)

for k = 1:length(tagList)
    % List of indices which fit all tags in tagList
    idxList{k} = find(all(matchMatrix(:,tagList{k}),2));
    % Error values of all 
% %     valueList{k} = -log10([tabulatedCalc(idxList{k}).totalError]');
    valueList{k} = -log10([tabulatedCalc(idxList{k}).adjTotalError]');
    
% %     meanError(k) = nanmean(valueList{k});
% %     stdError(k) = nanstd(valueList{k});
    
    meanError(k) = median(valueList{k},'omitnan');
    stdError(k) = mad(valueList{k},1);
    
    labelList{k} = sprintf('%s, ',stringMatchList{tagList{k}});
        labelList{k}(end-1:end) = [];
end






plotData = true;
plotMM   = false;
plotBST  = true;
plotR    = true;
plotRp   = true;


nTypes = 5; % Data, BST, R, Rp, spacers

idxData = 1:nTypes:length(tagList);
idxBST  = 2:nTypes:length(tagList);
idxR    = 3:nTypes:length(tagList);
idxRp   = 4:nTypes:length(tagList);


subPR = 5;
% % subPC = 8;
% % xW = 1;

subPC = 3;
xW = .35;


pArray = [];
for i = 1:5
    pArray(end+1:end+3) = (i-1)*subPC+1:(i-1)*subPC+3;
end

pList = num2cell(pArray);

plotMarker = 7;
linewidthvar = 1;


titleString{ 1} = 'CoV = 0.05';
titleString{ 2} = 'CoV = 0.15';
titleString{ 3} = 'CoV = 0.25';
titleString{ 4} = 'CoV = 0.05';
titleString{ 5} = 'CoV = 0.15';
titleString{ 6} = 'CoV = 0.25';
titleString{ 7} = 'CoV = 0.05';
titleString{ 8} = 'CoV = 0.15';
titleString{ 9} = 'CoV = 0.25';
titleString{10} = 'CoV = 0.05';
titleString{11} = 'CoV = 0.15';
titleString{12} = 'CoV = 0.25';
titleString{13} = 'CoV = 0.05';
titleString{14} = 'CoV = 0.15';
titleString{15} = 'CoV = 0.25';

xTextMult = -0.13;
yTextMult =  1.13;
letterList = 'ABCDEFGHIJKLMNO';

b = -1.5:.5:2;

a = [0,1.8];
for i = 1:3
    ylimlist{i} = a;
    yticklist{i} = b;
end

a = [0.1,1.8];
for i = 4:6
    ylimlist{i} = a;
    yticklist{i} = b;
end

a = [-0.3,1.8];
for i = 7:9
    ylimlist{i} = a;
    yticklist{i} = b;
end

a = [-0.6,1.8];
for i = 10:12
    ylimlist{i} = a;
    yticklist{i} = b;
end

a = [-1.3,2.0];
for i = 13:15
    ylimlist{i} = a;
    yticklist{i} = b;
end


h = figure('units','normalized','outerposition',[0 0 xW 1]);
for k = 1:15

    subplot(subPR,subPC,pList{k})
    
    x1 = (k-1)*5+1;
    x2 = k*5;
    n=1;
    
    hold on
    if plotData
        hList{k}(n) = plot([15,20,30,40,50],meanError(idxData(x1:x2)),'k-','markersize',plotMarker,'linewidth',linewidthvar);
        plot([15,20,30,40,50],meanError(idxData(x1:x2)) + stdError(idxData(x1:x2)),'k-.','markersize',plotMarker,'linewidth',0.5)
        plot([15,20,30,40,50],meanError(idxData(x1:x2)) - stdError(idxData(x1:x2)),'k-.','markersize',plotMarker,'linewidth',0.5)
        n=n+1;
    end
    
    if plotBST
        hList{k}(n) = plot([15,20,30,40,50],meanError(idxBST (x1:x2)),'m-p','markersize',plotMarker,'linewidth',linewidthvar);
        plot([15,20,30,40,50],meanError(idxBST (x1:x2)) + stdError(idxData(x1:x2)),'m-.','markersize',plotMarker,'linewidth',0.5)
        plot([15,20,30,40,50],meanError(idxBST (x1:x2)) - stdError(idxData(x1:x2)),'m-.','markersize',plotMarker,'linewidth',0.5)
        n=n+1;
    end

    if plotR
        hList{k}(n) = plot([15,20,30,40,50],meanError(idxR   (x1:x2)),'r-v','markersize',plotMarker,'linewidth',linewidthvar);
        plot([15,20,30,40,50],meanError(idxR   (x1:x2)) + stdError(idxData(x1:x2)),'r-.','markersize',plotMarker,'linewidth',0.5)
        plot([15,20,30,40,50],meanError(idxR   (x1:x2)) - stdError(idxData(x1:x2)),'r-.','markersize',plotMarker,'linewidth',0.5)
        n=n+1;
    end

    if plotRp
        hList{k}(n) = plot([15,20,30,40,50],meanError(idxRp  (x1:x2)),'b-s','markersize',plotMarker,'linewidth',linewidthvar);
        plot([15,20,30,40,50],meanError(idxRp  (x1:x2)) + stdError(idxData(x1:x2)),'b-.','markersize',plotMarker,'linewidth',0.5)
        plot([15,20,30,40,50],meanError(idxRp  (x1:x2)) - stdError(idxData(x1:x2)),'b-.','markersize',plotMarker,'linewidth',0.5)
        n=n+1;
    end
    
    textX = xTextMult * (52-13) + (13);
    textY = yTextMult * range(ylimlist{k}) + min(ylimlist{k});
    text(textX,textY,letterList(k),'fontsize',10,'FontWeight','bold')
    
    set(gca,'fontsize',8,'linewidth',2,'xlim',[13,52],'XTick',[15,20,30,40,50],'ylim',ylimlist{k},'YTick',yticklist{k})
    if k>12
        xlabel('nT','fontsize',11)
    end
    if ~rem(k-1,3)
        ylabel({'-log_1_0(prSSE)'},'fontsize',11)
    end
    if k<4
        title(titleString{k},'fontsize',10)
    end
    box on
    grid on
    
    
end

legendEntries = {};
if plotData
    legendEntries{end+1} = 'Data';
end
if plotBST
    legendEntries{end+1} = 'BST';
end
if plotR
    legendEntries{end+1} = 'FBA-LR';
end
if plotRp
    legendEntries{end+1} = 'FBA-LR+';
end

subplot(subPR,subPC,pList{end-1})
legend(hList{end-1},legendEntries,'fontsize',12,'Orientation','Horizontal','Position',[.135 .02 .75 .03]);


print('Fig3','-dtiff','-r300')



    