clc; clear; close all

errorFileName = 'processedError_branch_hiRes_compact.mat';

stringMatchList{ 1} = 'branch_k-01' ;            %  1
stringMatchList{ 2} = 'branch_k-02' ;            %  2
stringMatchList{ 3} = 'branch_k-03' ;            %  3
stringMatchList{ 4} = 'branch_k-04' ;            %  4
stringMatchList{ 5} = 'branch_k-05' ;            %  5
stringMatchList{ 6} = 'branch_k-06' ;            %  6
stringMatchList{ 7} = 'branch_k-07' ;            %  7
stringMatchList{ 8} = 'branch_k-08' ;            %  8
stringMatchList{ 9} = 'branch_k-09' ;            %  9
stringMatchList{10} = 'branch_k-10' ;            % 10
stringMatchList{11} = 'branch_k-11' ;            % 11
stringMatchList{12} = 'branch_k-12' ;            % 12
stringMatchList{13} = 'branch_k-13' ;            % 13
stringMatchList{14} = 'branch_k-14' ;            % 14
stringMatchList{15} = 'branch_k-15' ;            % 15
stringMatchList{16} = 'fbaRegressionParams';     % 16
stringMatchList{17} = 'fbaRegressionPlusParams'; % 17
stringMatchList{18} = 'fbaGaParams' ;            % 18
stringMatchList{19} = 'BstParams';               % 19
stringMatchList{20} = 'MmParams';                % 20


% Compare All
tagList = [];
tagList{end+1} = [ 1, 16]; % k01, fbaRegressionParams
tagList{end+1} = [ 1, 17]; % k01, fbaRegressionPlusParams
tagList{end+1} = [ 1, 18]; % k01, fbaGaParams
tagList{end+1} = [ 1, 19]; % k01, BstParams
tagList{end+1} = [ 1, 20]; % k01, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [ 2, 16]; % k02, fbaRegressionParams
tagList{end+1} = [ 2, 17]; % k02, fbaRegressionPlusParams
tagList{end+1} = [ 2, 18]; % k02, fbaGaParams
tagList{end+1} = [ 2, 19]; % k02, BstParams
tagList{end+1} = [ 2, 20]; % k02, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [ 3, 16]; % k03, fbaRegressionParams
tagList{end+1} = [ 3, 17]; % k03, fbaRegressionPlusParams
tagList{end+1} = [ 3, 18]; % k03, fbaGaParams
tagList{end+1} = [ 3, 19]; % k03, BstParams
tagList{end+1} = [ 3, 20]; % k03, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [ 4, 16]; % k04, fbaRegressionParams
tagList{end+1} = [ 4, 17]; % k04, fbaRegressionPlusParams
tagList{end+1} = [ 4, 18]; % k04, fbaGaParams
tagList{end+1} = [ 4, 19]; % k04, BstParams
tagList{end+1} = [ 4, 20]; % k04, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [ 5, 16]; % k05, fbaRegressionParams
tagList{end+1} = [ 5, 17]; % k05, fbaRegressionPlusParams
tagList{end+1} = [ 5, 18]; % k05, fbaGaParams
tagList{end+1} = [ 5, 19]; % k05, BstParams
tagList{end+1} = [ 5, 20]; % k05, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [ 6, 16]; % k06, fbaRegressionParams
tagList{end+1} = [ 6, 17]; % k06, fbaRegressionPlusParams
tagList{end+1} = [ 6, 18]; % k06, fbaGaParams
tagList{end+1} = [ 6, 19]; % k06, BstParams
tagList{end+1} = [ 6, 20]; % k06, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [ 7, 16]; % k07, fbaRegressionParams
tagList{end+1} = [ 7, 17]; % k07, fbaRegressionPlusParams
tagList{end+1} = [ 7, 18]; % k07, fbaGaParams
tagList{end+1} = [ 7, 19]; % k07, BstParams
tagList{end+1} = [ 7, 20]; % k07, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [ 8, 16]; % k08, fbaRegressionParams
tagList{end+1} = [ 8, 17]; % k08, fbaRegressionPlusParams
tagList{end+1} = [ 8, 18]; % k08, fbaGaParams
tagList{end+1} = [ 8, 19]; % k08, BstParams
tagList{end+1} = [ 8, 20]; % k08, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [ 9, 16]; % k09, fbaRegressionParams
tagList{end+1} = [ 9, 17]; % k09, fbaRegressionPlusParams
tagList{end+1} = [ 9, 18]; % k09, fbaGaParams
tagList{end+1} = [ 9, 19]; % k09, BstParams
tagList{end+1} = [ 9, 20]; % k09, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [10, 16]; % k10, fbaRegressionParams
tagList{end+1} = [10, 17]; % k10, fbaRegressionPlusParams
tagList{end+1} = [10, 18]; % k10, fbaGaParams
tagList{end+1} = [10, 19]; % k10, BstParams
tagList{end+1} = [10, 20]; % k10, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [11, 16]; % k11, fbaRegressionParams
tagList{end+1} = [11, 17]; % k11, fbaRegressionPlusParams
tagList{end+1} = [11, 18]; % k11, fbaGaParams
tagList{end+1} = [11, 19]; % k11, BstParams
tagList{end+1} = [11, 20]; % k11, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [12, 16]; % k12, fbaRegressionParams
tagList{end+1} = [12, 17]; % k12, fbaRegressionPlusParams
tagList{end+1} = [12, 18]; % k12, fbaGaParams
tagList{end+1} = [12, 19]; % k12, BstParams
tagList{end+1} = [12, 20]; % k12, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [13, 16]; % k13, fbaRegressionParams
tagList{end+1} = [13, 17]; % k13, fbaRegressionPlusParams
tagList{end+1} = [13, 18]; % k13, fbaGaParams
tagList{end+1} = [13, 19]; % k13, BstParams
tagList{end+1} = [13, 20]; % k13, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [14, 16]; % k14, fbaRegressionParams
tagList{end+1} = [14, 17]; % k14, fbaRegressionPlusParams
tagList{end+1} = [14, 18]; % k14, fbaGaParams
tagList{end+1} = [14, 19]; % k14, BstParams
tagList{end+1} = [14, 20]; % k14, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];


tagList{end+1} = [15, 16]; % k15, fbaRegressionParams
tagList{end+1} = [15, 17]; % k15, fbaRegressionPlusParams
tagList{end+1} = [15, 18]; % k15, fbaGaParams
tagList{end+1} = [15, 19]; % k15, BstParams
tagList{end+1} = [15, 20]; % k15, MmParams

tagList{end+1} = [1,2,3,4,5,6,7,8,9,10];



               
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
    
    meanError(k) = nanmean(valueList{k});
    stdError(k) = nanstd(valueList{k});
    
% %     meanError(k) = median(valueList{k},'omitnan');
% %     stdError(k) = mad(valueList{k},1);
    
    labelList{k} = sprintf('%s, ',stringMatchList{tagList{k}});
        labelList{k}(end-1:end) = [];
end





nTypes = 6; % R, R+, GA, BST, MM, spacer
legendEntries{1} = 'FBA-LR';
legendEntries{2} = 'FBA-LR+';
legendEntries{3} = 'FBA-GA';
legendEntries{4} = 'BST';
legendEntries{5} = 'MM';

plotXList = 1:15;

for k = 1:5
    plotIdxList{k} = k:nTypes:length(tagList);
end

plotStringList = {
                  'r-v';
                  'b-s';
                  'c-d';
                  'm-p';
                  'g-*';
                  };
              

% % plotOrder = [1,2,3,4,5];
plotOrder = [4,5,1,2,3];


w1 = [1 4];
wL = [5];
nMax = 5;
plotMarkersize = 20;
plotLineWidth = 2;
plotFontSize = 24;

figure('units','normalized','outerposition',[0 0 1 1]);

% % subplot(1,nMax,w1)
    hold on
    for i = plotOrder
        plot(plotXList,meanError(plotIdxList{i}),plotStringList{i},'markersize',plotMarkersize,'linewidth',plotLineWidth)
    end
        
    xlabel('Data Parameter Set #, k','fontsize',plotFontSize)
    ylabel({'Better performance \rightarrow','-log_1_0(prSSE)'},'fontsize',plotFontSize)
% %     title('','fontsize',plotFontSize)
    box on
    grid on
    set(gca,'fontsize',plotFontSize,'linewidth',2,'XTick',plotXList,'XLim',[min(plotXList)-0.5,max(plotXList)+0.5])
    
% %     hL = legend(legendEntries(plotOrder),'fontsize',24,'Location','East');
    hL = legend(legendEntries(plotOrder),'fontsize',24,'Position',[.789 .4 .098 .2]);
    
    
print('Figure S8','-dtiff','-r100')
    

