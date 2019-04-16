clc; clear; close all

errorFileName = 'processedError_branch_noisy_compact.mat';

% Only display parameters for this model type
idxType = 12;

ylimset = [0.2 2.2];
% % ylimset = [-2 4];
xlimset = [13,52];

xMult = -.2;
yMult = 1.1;


stringMatchList{1}  = 'hiRes';                   %  1
stringMatchList{2}  = 'nT-015';                  %  2
stringMatchList{3}  = 'nT-020';                  %  3
stringMatchList{4}  = 'nT-030';                  %  4
stringMatchList{5}  = 'nT-040';                  %  5
stringMatchList{6}  = 'nT-050';                  %  6
stringMatchList{7}  = 'cov-05';                  %  7
stringMatchList{8}  = 'cov-15';                  %  8
stringMatchList{9}  = 'cov-25';                  %  9
stringMatchList{10} = 'fbaGaParams' ;            % 13
stringMatchList{11} = 'fbaRegressionParams' ;    % 14
stringMatchList{12} = 'fbaRegressionPlusParams'; % 15
stringMatchList{13} = 'results_BST_noisy';       % 16
stringMatchList{14} = 'results_BSTp_noisy';      % 17
stringMatchList{15} = 'MmParams';                % 18
stringMatchList{16} = 'branchData';              % 19


tagList = [];
tagList{end+1} = [2, 7, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [3, 7, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [4, 7, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [5, 7, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [6, 7, idxType]; % nT-015, cov-05, smoothedBackslash, R+

tagList{end+1} = [2, 8, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [3, 8, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [4, 8, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [5, 8, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [6, 8, idxType]; % nT-015, cov-05, smoothedBackslash, R+

tagList{end+1} = [2, 9, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [3, 9, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [4, 9, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [5, 9, idxType]; % nT-015, cov-05, smoothedBackslash, R+
tagList{end+1} = [6, 9, idxType]; % nT-015, cov-05, smoothedBackslash, R+


               
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
    
% %     paramValsMean{k} = nan(size(tabulatedCalc(idxList{k}(1)).parameters));
% %     paramValsStd{k} = nan(size(tabulatedCalc(idxList{k}(1)).parameters));
    if ~isempty(idxList{k})
        for i = 1:numel(tabulatedCalc(idxList{k}(1)).parameters)
            for j = 1:length(idxList{k})
                valueList{k}(j) = tabulatedCalc(idxList{k}(j)).parameters(i);
            end

            paramValsMean{k}(i) = median(valueList{k},'omitnan');
            paramValsStd{k}(i) = mad(valueList{k},1);
        end
    else
        paramValsMean{k} = nan(size(paramValsMean{k-1}));
        paramValsStd{k} = nan(size(paramValsStd{k-1}));
    end
    
end

paramNames = {'a_1','a_2','a_3','a_4','a_5','a_6','b_1','b_2','b_3','b_4','b_5','b_6'};


plotMarker = 15;

idxLRpCov05 =  1: 5;
idxLRpCov15 =  6:10;
idxLRpCov25 = 11:15;

yH = 1;
xW = 1;

xText = 0.05;
yText = 0.05;
letterList = 'ABCDEFGHIJKL';

figure('units','normalized','outerposition',[0 1-yH xW yH]);

    for idxParam=1:12
        subplot(2,6,idxParam)
            hold on
            
            idxListCov = idxLRpCov05;
            for k = 1:length(idxListCov)
                plotMeanVals(k) = paramValsMean{idxListCov(k)}(idxParam);
                plotStdVals(k)  = paramValsStd{idxListCov(k)}(idxParam);
            end
            
            hList(1) = plot([15,20,30,40,50],plotMeanVals,'k-','markersize',plotMarker,'linewidth',2);
            plot([15,20,30,40,50],plotMeanVals + plotStdVals,'k-.','markersize',plotMarker,'linewidth',1)
            plot([15,20,30,40,50],plotMeanVals - plotStdVals,'k-.','markersize',plotMarker,'linewidth',1)
            
            
            idxListCov = idxLRpCov15;
            for k = 1:length(idxListCov)
                plotMeanVals(k) = paramValsMean{idxListCov(k)}(idxParam);
                plotStdVals(k)  = paramValsStd{idxListCov(k)}(idxParam);
            end
            
            hList(2) = plot([15,20,30,40,50],plotMeanVals,'b-','markersize',plotMarker,'linewidth',2);
            plot([15,20,30,40,50],plotMeanVals + plotStdVals,'b-.','markersize',plotMarker,'linewidth',1)
            plot([15,20,30,40,50],plotMeanVals - plotStdVals,'b-.','markersize',plotMarker,'linewidth',1)
            
            
            idxListCov = idxLRpCov25;
            for k = 1:length(idxListCov)
                plotMeanVals(k) = paramValsMean{idxListCov(k)}(idxParam);
                plotStdVals(k)  = paramValsStd{idxListCov(k)}(idxParam);
            end
            
           hList(3) =  plot([15,20,30,40,50],plotMeanVals,'r-','markersize',plotMarker,'linewidth',2);
            plot([15,20,30,40,50],plotMeanVals + plotStdVals,'r-.','markersize',plotMarker,'linewidth',1)
            plot([15,20,30,40,50],plotMeanVals - plotStdVals,'r-.','markersize',plotMarker,'linewidth',1)
            
            title(paramNames{idxParam},'fontsize',12)
            box on
            grid on
            set(gca,'fontsize',12,'linewidth',2,'XTick',[15 20:10:50],'XLim',[14,51])
    
            xlabel('nT','fontsize',12)
        
            xlimits = get(gca,'xlim');
            ylimits = get(gca,'ylim');
            xCoord = xMult * diff(xlimits) + xlimits(1);
            yCoord = yMult * diff(ylimits) + ylimits(1);
            text(xCoord,yCoord,letterList(idxParam),'fontsize',24,'fontweight','bold');
    
    end
    
    for i = [1,7]
        subplot(2,6,i)
        ylabel({'Median Parameter Value'},'fontsize',16)
    end
    
    subplot(2,6,12)
        legend(hList,{'CoV=0.05','CoV=0.15','CoV=0.25'},'Position',[.862 .405 .02 .02])
        %set(gca,'YLim',[-.05,0.45]);
    
    
print('Figure Sens1','-dtiff','-r200')
% % print('Figure 2','-dtiff','-r1200')

