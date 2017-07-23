clc; clear; close all; n=1;

odeDir = 'odeData';
resultsDir = 'results';


fileList{n} = sprintf('branchData/branch_k-01_hiRes.mat');
    plotStringList{n} = 'k-';
    lineWidthList(n) = 2;
    n=n+1;
    
fileList{n} = sprintf('branchData/branch_k-04_hiRes.mat');
    plotStringList{n} = 'b-';
    lineWidthList(n) = 2;
    n=n+1;


for k = 1:length(fileList)
    if exist(fileList{k},'file')
        if k == 1
            data(k) = load(fileList{k});
        else
            data(k) = orderfields(load(fileList{k}),data(1));
        end
        k=k+1;
    else
        fprintf('File "%s" not found \n',fileList{k});
    end
end


textFontSize = 18;
axisLineThickness = 3;

h = figure('units','normalized','outerposition',[0 0 1 1]);
set(gcf, 'Position', get(0,'ScreenSize'));

for k = 1:length(data)
    if ~isempty(data(k).tStart)

        subplot(5,6,13)
            hold on
            plot(data(k).fluxTimeVec,data(k).fluxMatrix(:,1),plotStringList{k},'LineWidth',lineWidthList(k))
            title('v_1','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,9)
            hold on
            plot(data(k).fluxTimeVec,data(k).fluxMatrix(:,2),plotStringList{k},'LineWidth',lineWidthList(k))
            title('v_2','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,11)
            hold on
            plot(data(k).fluxTimeVec,data(k).fluxMatrix(:,3),plotStringList{k},'LineWidth',lineWidthList(k))
            title('v_3','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,21)
            hold on
            plot(data(k).fluxTimeVec,data(k).fluxMatrix(:,4),plotStringList{k},'LineWidth',lineWidthList(k))
            title('v_4','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,8)
            hold on
            plot(data(k).fluxTimeVec,data(k).fluxMatrix(:,6),plotStringList{k},'LineWidth',lineWidthList(k))
            title('v_p_1','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,4)
            hold on
            plot(data(k).fluxTimeVec,data(k).fluxMatrix(:,7),plotStringList{k},'LineWidth',lineWidthList(k))
            title('v_p_2','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,18)
            hold on
            plot(data(k).fluxTimeVec,data(k).fluxMatrix(:,8),plotStringList{k},'LineWidth',lineWidthList(k))
            title('v_p_3')
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,28)
            hold on
                plot(data(k).fluxTimeVec,data(k).fluxMatrix(:,9),plotStringList{k},'LineWidth',lineWidthList(k))
            title('v_p_4','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,23)
            hold on
                plot(data(k).fluxTimeVec,data(k).fluxMatrix(:,5),plotStringList{k},'LineWidth',lineWidthList(k))
            title('v_B_M','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)


        subplot(5,6,14)
            hold on
            plot(data(k).timeVec,data(k).concMatrix(:,1),plotStringList{k},'LineWidth',lineWidthList(k))
            title('x_1','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,10)
            hold on
            plot(data(k).timeVec,data(k).concMatrix(:,2),plotStringList{k},'LineWidth',lineWidthList(k))
            title('x_2','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,17)
            hold on
            plot(data(k).timeVec,data(k).concMatrix(:,3),plotStringList{k},'LineWidth',lineWidthList(k))
            title('x_3','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,22)
            hold on
            plot(data(k).timeVec,data(k).concMatrix(:,4),plotStringList{k},'LineWidth',lineWidthList(k))
            title('x_4','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)

        subplot(5,6,30)
            hold on
            plot(data(k).timeVec,data(k).concMatrix(:,5),plotStringList{k},'LineWidth',lineWidthList(k))
            title('x_B_M','fontsize',textFontSize)
            xlim([data(k).tStart,data(k).tEnd])
            box on
            set(gca,'linewidth',axisLineThickness,'fontsize',textFontSize)
    end
end
