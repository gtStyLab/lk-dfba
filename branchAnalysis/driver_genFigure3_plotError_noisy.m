clc; clear; close all

errorFileName = 'processedError_branch_noisy_compact.mat';

ylimset = [0.2 2.2];
% % ylimset = [-2 4];
xlimset = [13,52];

xMult = -.09;
yMult = 1.05;


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
stringMatchList{16} = 'results_BST_noisy';       % 16
stringMatchList{17} = 'results_BSTp_noisy';      % 17
stringMatchList{18} = 'MmParams';                % 18
stringMatchList{19} = 'branchData';              % 19


tagList = [];
tagList{end+1} = [2, 7, 19];     % nT-015, cov-05, data
tagList{end+1} = [2, 7, 12, 18]; % nT-015, cov-05, smoothedBackslash, MM
tagList{end+1} = [2, 7, 12, 16]; % nT-015, cov-05, smoothedBackslash, BST
tagList{end+1} = [2, 7, 12, 17]; % nT-015, cov-05, smoothedBackslash, BSTp
tagList{end+1} = [2, 7, 12, 14]; % nT-015, cov-05, smoothedBackslash, R
tagList{end+1} = [2, 7, 12, 15]; % nT-015, cov-05, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [3, 7, 19];     % nT-020, cov-05, data
tagList{end+1} = [3, 7, 12, 18]; % nT-020, cov-05, smoothedBackslash, MM
tagList{end+1} = [3, 7, 12, 16]; % nT-020, cov-05, smoothedBackslash, BST
tagList{end+1} = [3, 7, 12, 17]; % nT-020, cov-05, smoothedBackslash, BSTp
tagList{end+1} = [3, 7, 12, 14]; % nT-020, cov-05, smoothedBackslash, R
tagList{end+1} = [3, 7, 12, 15]; % nT-020, cov-05, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [4, 7, 19];     % nT-030, cov-05, data
tagList{end+1} = [4, 7, 12, 18]; % nT-030, cov-05, smoothedBackslash, MM
tagList{end+1} = [4, 7, 12, 16]; % nT-030, cov-05, smoothedBackslash, BST
tagList{end+1} = [4, 7, 12, 17]; % nT-030, cov-05, smoothedBackslash, BSTp
tagList{end+1} = [4, 7, 12, 14]; % nT-030, cov-05, smoothedBackslash, R
tagList{end+1} = [4, 7, 12, 15]; % nT-030, cov-05, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [5, 7, 19];     % nT-040, cov-05, data
tagList{end+1} = [5, 7, 12, 18]; % nT-040, cov-05, smoothedBackslash, MM
tagList{end+1} = [5, 7, 12, 16]; % nT-040, cov-05, smoothedBackslash, BST
tagList{end+1} = [5, 7, 12, 17]; % nT-040, cov-05, smoothedBackslash, BSTp
tagList{end+1} = [5, 7, 12, 14]; % nT-040, cov-05, smoothedBackslash, R
tagList{end+1} = [5, 7, 12, 15]; % nT-040, cov-05, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [6, 7, 19];     % nT-050, cov-05, data
tagList{end+1} = [6, 7, 12, 18]; % nT-050, cov-05, smoothedBackslash, MM
tagList{end+1} = [6, 7, 12, 16]; % nT-050, cov-05, smoothedBackslash, BST
tagList{end+1} = [6, 7, 12, 17]; % nT-050, cov-05, smoothedBackslash, BSTp
tagList{end+1} = [6, 7, 12, 14]; % nT-050, cov-05, smoothedBackslash, R
tagList{end+1} = [6, 7, 12, 15]; % nT-050, cov-05, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [2, 8, 19];     % nT-015, cov-15, data
tagList{end+1} = [2, 8, 12, 18]; % nT-015, cov-15, smoothedBackslash, MM
tagList{end+1} = [2, 8, 12, 16]; % nT-015, cov-15, smoothedBackslash, BST
tagList{end+1} = [2, 8, 12, 17]; % nT-015, cov-15, smoothedBackslash, BSTp
tagList{end+1} = [2, 8, 12, 14]; % nT-015, cov-15, smoothedBackslash, R
tagList{end+1} = [2, 8, 12, 15]; % nT-015, cov-15, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [3, 8, 19];     % nT-020, cov-15, data
tagList{end+1} = [3, 8, 12, 18]; % nT-020, cov-15, smoothedBackslash, MM
tagList{end+1} = [3, 8, 12, 16]; % nT-020, cov-15, smoothedBackslash, BST
tagList{end+1} = [3, 8, 12, 17]; % nT-020, cov-15, smoothedBackslash, BSTp
tagList{end+1} = [3, 8, 12, 14]; % nT-020, cov-15, smoothedBackslash, R
tagList{end+1} = [3, 8, 12, 15]; % nT-020, cov-15, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [4, 8, 19];     % nT-030, cov-15, data
tagList{end+1} = [4, 8, 12, 18]; % nT-030, cov-15, smoothedBackslash, MM
tagList{end+1} = [4, 8, 12, 16]; % nT-030, cov-15, smoothedBackslash, BST
tagList{end+1} = [4, 8, 12, 17]; % nT-030, cov-15, smoothedBackslash, BSTp
tagList{end+1} = [4, 8, 12, 14]; % nT-030, cov-15, smoothedBackslash, R
tagList{end+1} = [4, 8, 12, 15]; % nT-030, cov-15, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [5, 8, 19];     % nT-040, cov-15, data
tagList{end+1} = [5, 8, 12, 18]; % nT-040, cov-15, smoothedBackslash, MM
tagList{end+1} = [5, 8, 12, 16]; % nT-040, cov-15, smoothedBackslash, BST
tagList{end+1} = [5, 8, 12, 17]; % nT-040, cov-15, smoothedBackslash, BSTp
tagList{end+1} = [5, 8, 12, 14]; % nT-040, cov-15, smoothedBackslash, R
tagList{end+1} = [5, 8, 12, 15]; % nT-040, cov-15, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [6, 8, 19];     % nT-050, cov-15, data
tagList{end+1} = [6, 8, 12, 18]; % nT-050, cov-15, smoothedBackslash, MM
tagList{end+1} = [6, 8, 12, 16]; % nT-050, cov-15, smoothedBackslash, BST
tagList{end+1} = [6, 8, 12, 17]; % nT-050, cov-15, smoothedBackslash, BSTp
tagList{end+1} = [6, 8, 12, 14]; % nT-050, cov-15, smoothedBackslash, R
tagList{end+1} = [6, 8, 12, 15]; % nT-050, cov-15, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [2, 9, 19];     % nT-015, cov-25, data
tagList{end+1} = [2, 9, 12, 18]; % nT-015, cov-25, smoothedBackslash, MM
tagList{end+1} = [2, 9, 12, 16]; % nT-015, cov-25, smoothedBackslash, BST
tagList{end+1} = [2, 9, 12, 17]; % nT-015, cov-25, smoothedBackslash, BSTp
tagList{end+1} = [2, 9, 12, 14]; % nT-015, cov-25, smoothedBackslash, R
tagList{end+1} = [2, 9, 12, 15]; % nT-015, cov-25, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [3, 9, 19];     % nT-020, cov-25, data
tagList{end+1} = [3, 9, 12, 18]; % nT-020, cov-25, smoothedBackslash, MM
tagList{end+1} = [3, 9, 12, 16]; % nT-020, cov-25, smoothedBackslash, BST
tagList{end+1} = [3, 9, 12, 17]; % nT-020, cov-25, smoothedBackslash, BSTp
tagList{end+1} = [3, 9, 12, 14]; % nT-020, cov-25, smoothedBackslash, R
tagList{end+1} = [3, 9, 12, 15]; % nT-020, cov-25, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [4, 9, 19];     % nT-030, cov-25, data
tagList{end+1} = [4, 9, 12, 18]; % nT-030, cov-25, smoothedBackslash, MM
tagList{end+1} = [4, 9, 12, 16]; % nT-030, cov-25, smoothedBackslash, BST
tagList{end+1} = [4, 9, 12, 17]; % nT-030, cov-25, smoothedBackslash, BSTp
tagList{end+1} = [4, 9, 12, 14]; % nT-030, cov-25, smoothedBackslash, R
tagList{end+1} = [4, 9, 12, 15]; % nT-030, cov-25, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [5, 9, 19];     % nT-040, cov-25, data
tagList{end+1} = [5, 9, 12, 18]; % nT-040, cov-25, smoothedBackslash, MM
tagList{end+1} = [5, 9, 12, 16]; % nT-040, cov-25, smoothedBackslash, BST
tagList{end+1} = [5, 9, 12, 17]; % nT-040, cov-25, smoothedBackslash, BSTp
tagList{end+1} = [5, 9, 12, 14]; % nT-040, cov-25, smoothedBackslash, R
tagList{end+1} = [5, 9, 12, 15]; % nT-040, cov-25, smoothedBackslash, R+

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];     % Spacer

tagList{end+1} = [6, 9, 19];     % nT-050, cov-25, data
tagList{end+1} = [6, 9, 12, 18]; % nT-050, cov-25, smoothedBackslash, MM
tagList{end+1} = [6, 9, 12, 16]; % nT-050, cov-25, smoothedBackslash, BST
tagList{end+1} = [6, 9, 12, 17]; % nT-050, cov-25, smoothedBackslash, BSTp
tagList{end+1} = [6, 9, 12, 14]; % nT-050, cov-25, smoothedBackslash, R
tagList{end+1} = [6, 9, 12, 15]; % nT-050, cov-25, smoothedBackslash, R+


               

               
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
plotMM   = true;% false;
plotBST  = true;
plotBSTp = false;
plotR    = true;
plotRp   = true;


nTypes = 7; % Data, MM, BST, BSTp R, Rp, spacers
plotMarker = 10;

idxData = 1:nTypes:length(tagList);
idxMM   = 2:nTypes:length(tagList);
idxBST  = 3:nTypes:length(tagList);
idxBSTp  = 4:nTypes:length(tagList);
idxR    = 5:nTypes:length(tagList);
idxRp   = 6:nTypes:length(tagList);

w1 = [1 2];
w2 = [3 4];
w3 = [5 6];
wL = [7];
nMax = 7;

yH = 0.5;
xW = 0.475;

figure('units','normalized','outerposition',[0 1-yH xW yH]);

    letterIndex = 'A';
    subplot(1,nMax,w1)
    hold on
    if plotData
        plot([15,20,30,40,50],meanError(idxData(1 : 5)),'k-','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxData(1 : 5)) + stdError(idxData(1 : 5)),'k-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxData(1 : 5)) - stdError(idxData(1 : 5)),'k-.','markersize',plotMarker,'linewidth',1)
    end
    
    if plotMM
        plot([15,20,30,40,50],meanError(idxMM  (1 : 5)),'g-*','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxMM  (1 : 5)) + stdError(idxData(1 : 5)),'g-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxMM  (1 : 5)) - stdError(idxData(1 : 5)),'g-.','markersize',plotMarker,'linewidth',1)
    end

    if plotBST
        plot([15,20,30,40,50],meanError(idxBST (1 : 5)),'m-p','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBST (1 : 5)) + stdError(idxData(1 : 5)),'m-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBST (1 : 5)) - stdError(idxData(1 : 5)),'m-.','markersize',plotMarker,'linewidth',1)
    end

    if plotBSTp
        plot([15,20,30,40,50],meanError(idxBSTp(1 : 5)),'m-s','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBSTp(1 : 5)) + stdError(idxData(1 : 5)),'m-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBSTp(1 : 5)) - stdError(idxData(1 : 5)),'m-.','markersize',plotMarker,'linewidth',1)
    end

    if plotR
        plot([15,20,30,40,50],meanError(idxR   (1 : 5)),'r-v','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxR   (1 : 5)) + stdError(idxData(1 : 5)),'r-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxR   (1 : 5)) - stdError(idxData(1 : 5)),'r-.','markersize',plotMarker,'linewidth',1)
    end

    if plotRp
        plot([15,20,30,40,50],meanError(idxRp  (1 : 5)),'b-s','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxRp  (1 : 5)) + stdError(idxData(1 : 5)),'b-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxRp  (1 : 5)) - stdError(idxData(1 : 5)),'b-.','markersize',plotMarker,'linewidth',1)
    end

    set(gca,'fontsize',8,'linewidth',1,'xlim',xlimset,'ylim',ylimset,'XTick',[15 20:10:50],'YTick',ylimset(1):.2:ylimset(end))
    xlabel('nT','fontsize',12)
    ylabel({'Better performance \rightarrow','-log_1_0(prSSE)'},'fontsize',12)
    title('CoV = 0.05','fontsize',10)
    box on
    grid on
    
    
    xlimits = get(gca,'xlim');
    ylimits = get(gca,'ylim');
    xCoord = xMult * diff(xlimits) + xlimits(1);
    yCoord = yMult * diff(ylimits) + ylimits(1);
    
    text(xCoord,yCoord,letterIndex,'fontsize',12,'fontweight','bold');
    
    
    letterIndex = 'B';
    subplot(1,nMax,w2)
    hold on
    if plotData
        plot([15,20,30,40,50],meanError(idxData(6 :10)),'k-','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxData(6 :10)) + stdError(idxData(6 :10)),'k-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxData(6 :10)) - stdError(idxData(6 :10)),'k-.','markersize',plotMarker,'linewidth',1)
    end

    if plotMM
        plot([15,20,30,40,50],meanError(idxMM  (6 :10)),'g-*','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxMM  (6 :10)) + stdError(idxData(6 :10)),'g-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxMM  (6 :10)) - stdError(idxData(6 :10)),'g-.','markersize',plotMarker,'linewidth',1)
    end

    if plotBST
        plot([15,20,30,40,50],meanError(idxBST (6 :10)),'m-p','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBST (6 :10)) + stdError(idxData(6 :10)),'m-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBST (6 :10)) - stdError(idxData(6 :10)),'m-.','markersize',plotMarker,'linewidth',1)
    end

    if plotBSTp
        plot([15,20,30,40,50],meanError(idxBSTp(6 :10)),'m-s','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBSTp(6 :10)) + stdError(idxData(6 :10)),'m-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBSTp(6 :10)) - stdError(idxData(6 :10)),'m-.','markersize',plotMarker,'linewidth',1)
    end

    if plotR
        plot([15,20,30,40,50],meanError(idxR   (6 :10)),'r-v','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxR   (6 :10)) + stdError(idxData(6 :10)),'r-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxR   (6 :10)) - stdError(idxData(6 :10)),'r-.','markersize',plotMarker,'linewidth',1)
    end

    if plotRp
        plot([15,20,30,40,50],meanError(idxRp  (6 :10)),'b-s','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxRp  (6 :10)) + stdError(idxData(6 :10)),'b-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxRp  (6 :10)) - stdError(idxData(6 :10)),'b-.','markersize',plotMarker,'linewidth',1)
    end
    
    set(gca,'fontsize',8,'linewidth',1,'xlim',xlimset,'ylim',ylimset,'XTick',[15 20:10:50],'YTick',ylimset(1):.2:ylimset(end))
    xlabel('nT','fontsize',12)
    title('CoV = 0.15','fontsize',10)
    box on
    grid on
    
    xlimits = get(gca,'xlim');
    ylimits = get(gca,'ylim');
    xCoord = xMult * diff(xlimits) + xlimits(1);
    yCoord = yMult * diff(ylimits) + ylimits(1);
    
    text(xCoord,yCoord,letterIndex,'fontsize',12,'fontweight','bold');
    
    
    letterIndex = 'C';
    subplot(1,nMax,w3)
    hold on
    if plotData
        plot([15,20,30,40,50],meanError(idxData(11:15)),'k-','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxData(11:15)) + stdError(idxData(11:15)),'k-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxData(11:15)) - stdError(idxData(11:15)),'k-.','markersize',plotMarker,'linewidth',1)
    end

    if plotMM
        plot([15,20,30,40,50],meanError(idxMM  (11:15)),'g-*','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxMM  (11:15)) + stdError(idxData(11:15)),'g-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxMM  (11:15)) - stdError(idxData(11:15)),'g-.','markersize',plotMarker,'linewidth',1)
    end

    if plotBST
        plot([15,20,30,40,50],meanError(idxBST (11:15)),'m-p','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBST (11:15)) + stdError(idxData(11:15)),'m-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBST (11:15)) - stdError(idxData(11:15)),'m-.','markersize',plotMarker,'linewidth',1)
    end

    if plotBSTp
        plot([15,20,30,40,50],meanError(idxBSTp(11:15)),'m-s','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBSTp(11:15)) + stdError(idxData(11:15)),'m-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxBSTp(11:15)) - stdError(idxData(11:15)),'m-.','markersize',plotMarker,'linewidth',1)
    end

    if plotR
        plot([15,20,30,40,50],meanError(idxR   (11:15)),'r-v','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxR   (11:15)) + stdError(idxData(11:15)),'r-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxR   (11:15)) - stdError(idxData(11:15)),'r-.','markersize',plotMarker,'linewidth',1)
    end

    if plotRp
        plot([15,20,30,40,50],meanError(idxRp  (11:15)),'b-s','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxRp  (11:15)) + stdError(idxData(11:15)),'b-.','markersize',plotMarker,'linewidth',1)
        plot([15,20,30,40,50],meanError(idxRp  (11:15)) - stdError(idxData(11:15)),'b-.','markersize',plotMarker,'linewidth',1)
    end
        
    set(gca,'fontsize',8,'linewidth',1,'xlim',xlimset,'ylim',ylimset,'XTick',[15 20:10:50],'YTick',ylimset(1):.2:ylimset(end))
    xlabel('nT','fontsize',12)
    title('CoV = 0.25','fontsize',10)
    box on
    grid on
    
    xlimits = get(gca,'xlim');
    ylimits = get(gca,'ylim');
    xCoord = xMult * diff(xlimits) + xlimits(1);
    yCoord = yMult * diff(ylimits) + ylimits(1);
    
    text(xCoord,yCoord,letterIndex,'fontsize',12,'fontweight','bold');
    
    

    subplot(1,nMax,nMax)
    hold on
    legendEntries = {};
    if plotData
        h{1} = plot(15,meanError(idxData(1)),'k-','markersize',plotMarker,'linewidth',1);
        legendEntries{end+1} = 'Data';
    end

    if plotMM
        h{2} = plot(15,meanError(idxMM  (1)),'g-*','markersize',plotMarker,'linewidth',1);
        legendEntries{end+1} = 'MM';
    end

    if plotBST
        h{3} = plot(15,meanError(idxBST (1)),'m-p','markersize',plotMarker,'linewidth',1);
        legendEntries{end+1} = 'BST';
    end

    if plotBSTp
        h{3} = plot(15,meanError(idxBST (1)),'m-s','markersize',plotMarker,'linewidth',1);
        legendEntries{end+1} = 'BST+';
    end

    if plotR
        h{4} = plot(15,meanError(idxR   (1)),'r-v','markersize',plotMarker,'linewidth',1);
        legendEntries{end+1} = 'FBA-LR';
    end

    if plotRp
        h{5} = plot(15,meanError(idxRp  (1)),'b-s','markersize',plotMarker,'linewidth',1);
        legendEntries{end+1} = 'FBA-LR+';
    end
    ylim([-10 -9.999]);
    
    set(gca,'Visible','off')
    hL = legend(legendEntries,'fontsize',10,'Location','East');
    set(hL,'Visible','on')
    
    
print('Fig3','-dtiff','-r300')

