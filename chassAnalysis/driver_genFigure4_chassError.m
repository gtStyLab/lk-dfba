clc; clear; close all

errorFileName = 'processedError_chass_compact.mat';

ylimset = [0,2];
xlimset = [18,42];
xtickset = [20,30,40];
ytickset = 0:.2:2;

xMult = -.1;
yMult = 1.06;

letterIndex1 = 'A';
letterIndex2 = 'B';

stringMatchList{ 1} =  'chassData';
stringMatchList{ 2} =  'results_unsplit';
stringMatchList{ 3} =  'results_split';
stringMatchList{ 4}  = 'nT-020';
stringMatchList{ 5}  = 'nT-030';
stringMatchList{ 6}  = 'nT-040';
stringMatchList{ 7}  = 'cov-10';
stringMatchList{ 8}  = 'cov-20';
stringMatchList{ 9}  = 'fbaRegressionParams';
stringMatchList{10}  = 'fbaRegressionPlusParams';


% % % Comaprison
tagList = [];

tagList{end+1} = [1, 4, 7];     % Data,    nT-020, cov-10
tagList{end+1} = [2, 4, 7,  9]; % Unsplit, nT-020, cov-10, R
tagList{end+1} = [2, 4, 7, 10]; % Unsplit, nT-020, cov-10, R+
tagList{end+1} = [3, 4, 7,  9]; % Split,   nT-020, cov-10, R
tagList{end+1} = [3, 4, 7, 10]; % Split,   nT-020, cov-10, R+

tagList{end+1} = [1 2 3 4 5 6 7 8 9 10];

tagList{end+1} = [1, 5, 7];     % Data,    nT-030, cov-10
tagList{end+1} = [2, 5, 7,  9]; % Unsplit, nT-030, cov-10, R
tagList{end+1} = [2, 5, 7, 10]; % Unsplit, nT-030, cov-10, R+
tagList{end+1} = [3, 5, 7,  9]; % Split,   nT-030, cov-10, R
tagList{end+1} = [3, 5, 7, 10]; % Split,   nT-030, cov-10, R+

tagList{end+1} = [1 2 3 4 5 6 7 8 9 10];

tagList{end+1} = [1, 6, 7];     % Data,    nT-040, cov-10
tagList{end+1} = [2, 6, 7,  9]; % Unsplit, nT-040, cov-10, R
tagList{end+1} = [2, 6, 7, 10]; % Unsplit, nT-040, cov-10, R+
tagList{end+1} = [3, 6, 7,  9]; % Split,   nT-040, cov-10, R
tagList{end+1} = [3, 6, 7, 10]; % Split,   nT-040, cov-10, R+

tagList{end+1} = [1 2 3 4 5 6 7 8 9 10];

tagList{end+1} = [1, 4, 8];     % Data,    nT-020, cov-20
tagList{end+1} = [2, 4, 8,  9]; % Unsplit, nT-020, cov-20, R
tagList{end+1} = [2, 4, 8, 10]; % Unsplit, nT-020, cov-20, R+
tagList{end+1} = [3, 4, 8,  9]; % Split,   nT-020, cov-20, R
tagList{end+1} = [3, 4, 8, 10]; % Split,   nT-020, cov-20, R+

tagList{end+1} = [1 2 3 4 5 6 7 8 9 10];

tagList{end+1} = [1, 5, 8];     % Data,    nT-030, cov-20
tagList{end+1} = [2, 5, 8,  9]; % Unsplit, nT-030, cov-20, R
tagList{end+1} = [2, 5, 8, 10]; % Unsplit, nT-030, cov-20, R+
tagList{end+1} = [3, 5, 8,  9]; % Split,   nT-030, cov-20, R
tagList{end+1} = [3, 5, 8, 10]; % Split,   nT-030, cov-20, R+

tagList{end+1} = [1 2 3 4 5 6 7 8 9 10];

tagList{end+1} = [1, 6, 8];     % Data,    nT-040, cov-20
tagList{end+1} = [2, 6, 8,  9]; % Unsplit, nT-040, cov-20, R
tagList{end+1} = [2, 6, 8, 10]; % Unsplit, nT-040, cov-20, R+
tagList{end+1} = [3, 6, 8,  9]; % Split,   nT-040, cov-20, R
tagList{end+1} = [3, 6, 8, 10]; % Split,   nT-040, cov-20, R+

tagList{end+1} = [1 2 3 4 5 6 7 8 9 10];


               

               
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
% %     valueList{k} = -log10([tabulatedCalc(idxList{k}).adjTotalError]');
    
% %     valueList{k} = -log10([tabulatedCalc(idxList{k}).concError]');
    valueList{k} = -log10([tabulatedCalc(idxList{k}).adjConcError]');
    
% %     meanError(k) = nanmean(valueList{k});
% %     stdError(k) = nanstd(valueList{k});
    
    meanError(k) = median(valueList{k},'omitnan') +1.6;
    stdError(k) = mad(valueList{k},1);
    
    labelList{k} = sprintf('%s, ',stringMatchList{tagList{k}});
        labelList{k}(end-1:end) = [];
end



nTypes = 6; % Data, U-R, U-R+, S-R, S-R+, spacers
plotMarker = 20;

legendEntries{1} = 'Data';
legendEntries{2} = 'Unsplit-LR';
legendEntries{3} = 'Unsplit-LR+';
legendEntries{4} = 'Split-LR';
legendEntries{5} = 'Split-LR+';

for k = 1:5
    plotIdxList{k} = k:nTypes:length(tagList);
end

plotStringList = {
                  'k-';  % Data
                  'c-v'; % U-R
                  'b-s'; % U-R+
                  'm-^'; % S-R
                  'r-d'; % S-R+
                  };
              

plotOrder = [1,2,3,4,5];


numRows = 4;
numCols = 5;
w1 = [1 17];
w2 = [3 19];
wL = [5 15];

% % nMax = 5;
plotMarkersize = 8;
plotLineWidth = 1.5;
plotFontSize = 12;


yH = 0.6;
xW = 0.475;

figure('units','normalized','outerposition',[0 1-yH xW yH]);
subplot(numRows,numCols,w1)

    plotXList = [20 30 40];
    plotYIdx = 1:3;
    hold on
    for i = plotOrder
        plot(plotXList, meanError(plotIdxList{i}(plotYIdx)),plotStringList{i},'markersize',plotMarkersize,'linewidth',plotLineWidth)
        plot(plotXList, meanError(plotIdxList{i}(plotYIdx)) + stdError(plotIdxList{i}(plotYIdx)), plotStringList{i}(1),'Linestyle',':','linewidth',plotLineWidth)
        plot(plotXList, meanError(plotIdxList{i}(plotYIdx)) - stdError(plotIdxList{i}(plotYIdx)), plotStringList{i}(1),'Linestyle',':','linewidth',plotLineWidth)
    end
        
    set(gca,'fontsize',10,'linewidth',2,'XTick',xtickset,'XLim',xlimset)
    set(gca,'ylim',ylimset,'YTick',ytickset)
    xlabel('nT','fontsize',plotFontSize)
% %     ylabel({'-log_1_0(SSE)','Better performance \rightarrow'},'fontsize',plotFontSize)
    ylabel({'Better performance \rightarrow','-log_1_0(prSSE)'},'fontsize',plotFontSize)
    title('CoV = 0.10','fontsize',plotFontSize)
    box on
    grid on
    
    xlimits = get(gca,'xlim');
    ylimits = get(gca,'ylim');
    xCoord = xMult * diff(xlimits) + xlimits(1);
    yCoord = yMult * diff(ylimits) + ylimits(1);
    
    text(xCoord,yCoord,letterIndex1,'fontsize',12,'fontweight','bold');


subplot(numRows,numCols,w2)
    plotXList = [20 30 40];
    plotYIdx = 4:6;    
    hold on
    for i = plotOrder
        plot(plotXList, meanError(plotIdxList{i}(plotYIdx)),plotStringList{i},'markersize',plotMarkersize,'linewidth',plotLineWidth)
        plot(plotXList, meanError(plotIdxList{i}(plotYIdx)) + stdError(plotIdxList{i}(plotYIdx)), plotStringList{i}(1),'Linestyle',':','linewidth',plotLineWidth)
        plot(plotXList, meanError(plotIdxList{i}(plotYIdx)) - stdError(plotIdxList{i}(plotYIdx)), plotStringList{i}(1),'Linestyle',':','linewidth',plotLineWidth)
    end
        
    set(gca,'fontsize',10,'linewidth',2,'XTick',xtickset,'XLim',xlimset)
    set(gca,'ylim',ylimset,'YTick',ytickset)
    xlabel('nT','fontsize',plotFontSize)
    title('CoV = 0.20','fontsize',plotFontSize)
    box on
    grid on
    
    xlimits = get(gca,'xlim');
    ylimits = get(gca,'ylim');
    xCoord = xMult * diff(xlimits) + xlimits(1);
    yCoord = yMult * diff(ylimits) + ylimits(1);
    
    text(xCoord,yCoord,letterIndex2,'fontsize',12,'fontweight','bold');
    
subplot(numRows,numCols,wL)
    hold on
    
    for i = plotOrder
        plot(1,meanError(plotIdxList{i}(1)),plotStringList{i},'markersize',plotMarkersize,'linewidth',plotLineWidth);
    end

    ylim([-10 -9.999]);
    set(gca,'Visible','off')
    hL = legend(legendEntries(plotOrder),'fontsize',12,'Location','East');
    set(hL,'Visible','on')
    
    
print('Fig4','-dtiff','-r300')

    
    