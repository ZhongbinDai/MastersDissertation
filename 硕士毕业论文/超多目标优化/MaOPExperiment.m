%% 批量实验
algorithms = {@NSGAIII, @MaOEAIGD, @MaOEAIT, @MaOEARD, @ARNSGAIII};
problems0 = {@DTLZ1, @DTLZ2, @DTLZ3, @DTLZ4, @DTLZ5, @DTLZ6, @DTLZ7};
problems1 = {@MaF1, @MaF2, @MaF3, @MaF4, @MaF5, @MaF6, @MaF7, @MaF8, @MaF9, @MaF10, @MaF11, @MaF12, @MaF13};
problems  = [problems0, problems1];
Ms = zeros(size(problems)) + 4;

maxFE = 30000;
save = 20;
runs = 30;

parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'M', Ms(j),'maxFE',maxFE,'save',save);
        end
    end
end


%% 批量计算结果文件指标，若已有指标直接读取，若无先计算再写入
resultDataFolderPath = '.\Data\MaOPResult\';
metricName = 'HV';
algorithms = {@NSGAIII, @MaOEAIGD, @MaOEAIT, @MaOEARD, @ARNSGAIII};
problems0 = {@DTLZ1, @DTLZ2, @DTLZ3, @DTLZ4, @DTLZ5, @DTLZ6, @DTLZ7};
problems1 = {@MaF1, @MaF2, @MaF3, @MaF4, @MaF5, @MaF6, @MaF7, @MaF8, @MaF9, @MaF10, @MaF11, @MaF12, @MaF13};
problems  = [problems0, problems1];
Ms = zeros(size(problems)) + 4;
[Ds] = getDecDim(problems, Ms);

parfor i = 1 : length(problems)
    [metricsMatrix] = computeMetricsMatrix(algorithms, problems{i}, Ms(i), Ds(i), metricName, resultDataFolderPath);
end


%% 各算法在20种测试函数上的IGD指标箱形图
resultDataFolderPath = '.\Data\MaOPResult\';
metricName = 'HV';
algorithms = {@NSGAIII, @MaOEAIGD, @MaOEAIT, @MaOEARD, @ARNSGAIII};
algorithmsName = {'NSGA-III', 'MaOEA-IGD', 'MaOEA-IT', 'MaOEA-R&D' ,'AR-NSGA-III'};
problems0 = {@DTLZ1, @DTLZ2, @DTLZ3, @DTLZ4, @DTLZ5, @DTLZ6, @DTLZ7};
problems1 = {@MaF1, @MaF2, @MaF3, @MaF4, @MaF5, @MaF6, @MaF7, @MaF8, @MaF9, @MaF10, @MaF11, @MaF12, @MaF13};
problems  = [problems0, problems1];
Ms = zeros(size(problems)) + 4;
[Ds] = getDecDim(problems, Ms);

row = 5;
col = 4;
for i = 1 : row
    for j = 1 : col
        id = (i-1)*col + j;
        subplot(row,col,id);
        [metricsMatrix] = getMetricsMatrix(algorithms, problems{id}, Ms(id), Ds(id), metricName, resultDataFolderPath);
        boxplot(metricsMatrix', algorithmsName);
        title(func2str(problems{id}));
        ylabel(metricName);
        xtickangle(30);
    end
end
set(gcf,'position',[0,0,3000,3000]); 
printpreview;
% 打印预览，然后手动操作[手动确定大小及位置]->[填满页面]

saveFolderPath = '.\Image\';
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
imageName = sprintf('各算法在20种测试函数上的%s指标箱形图', metricName);
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end


%% 种群进化IGD指标折线图
resultDataFolderPath = '.\Data\MaOPResult\';
metricName = 'HV';
algorithms = {@NSGAIII, @MaOEAIGD, @MaOEAIT, @MaOEARD, @ARNSGAIII};
algorithmsName = {'NSGA-III', 'MaOEA-IGD', 'MaOEA-IT', 'MaOEA-R&D' ,'AR-NSGA-III'};
problems0 = {@DTLZ1, @DTLZ2, @DTLZ3, @DTLZ4, @DTLZ5, @DTLZ6, @DTLZ7};
problems1 = {@MaF1, @MaF2, @MaF3, @MaF4, @MaF5, @MaF6, @MaF7, @MaF8, @MaF9, @MaF10, @MaF11, @MaF12, @MaF13};
problems  = [problems0, problems1];
Ms = zeros(size(problems)) + 4;
[Ds] = getDecDim(problems, Ms);


row = 7;
col = 3;
for i = 1 : row
    for j = 1 : col
        id = (i-1)*col + j;
        if id > 20
            break;
        end
        subplot(row,col,id);
        problem = problems{id};
        for k = 1 : length(algorithms)
            algorithm = algorithms{k};
            [fes, metricMean] = getMetricMean(algorithm, problem, Ms(id), Ds(id), metricName, resultDataFolderPath);
            plot(fes, (metricMean),'.-', 'MarkerSize',8,'LineWidth',0.6);
%             plot(fes, log(metricMean)/log(100),'.-', 'MarkerSize',8,'LineWidth',0.6);
            hold on;
        end
        title(func2str(problem));
%         xStr = ['1og\it_{100}(' metricName ')'];
        xStr = metricName;
        ylabel(xStr);
        xlabel('Number of function evaluations');
    end
end
legend(gca, algorithmsName,'Location','bestoutside');
set(gcf,'position',[0,0,3000,3000]); 
printpreview;
% 打印预览，然后手动操作[手动确定大小及位置]->[填满页面]

saveFolderPath = '.\Image\';
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
imageName = sprintf('种群进化%s指标折线图', metricName);
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end


%% 种群目标空间分布图
clear;                                                                      % 清除所有变量
close all;                                                                  % 清图
clc;                                                                        % 清屏
resultDataFolderPath = '.\Data\MaOPResult\';
metricName = 'IGD';
algorithms = {@NSGAIII, @MaOEAIGD, @MaOEAIT, @MaOEARD, @ARNSGAIII};
algorithmsName = {'NSGA-III', 'MaOEA-IGD', 'MaOEA-IT', 'MaOEA-R&D' ,'AR-NSGA-III'};
problems0 = {@DTLZ1, @DTLZ2, @DTLZ3, @DTLZ4, @DTLZ5, @DTLZ6, @DTLZ7};
problems1 = {@MaF1, @MaF2, @MaF3, @MaF4, @MaF5, @MaF6, @MaF7};
problems2 = {@MaF8, @MaF9, @MaF10, @MaF11, @MaF12, @MaF13};
problems  = problems0;                                                     % 手动修改
Ms = zeros(size(problems)) + 4;
[Ds] = getDecDim(problems, Ms);
type = 'decs';          % type = 'objs';
k = 1;

row = 7;
col = 5;
for i = 1 : row
    if i > length(problems)
        break;
    end
    problem = problems{i};
    M = Ms(i);
    D = Ds(i);
    Problem = problem('M', M, 'D', D);
    for j = 1 : col
        id = (i-1)*col + j;
        subplot(row,col,id);
        algorithm = algorithms{j};
%         [resultDataFilePath] = getResultDataFilePath(algorithm, problem, M, D, k, resultDataFolderPath);
        [medianDataFilePath] = getMedianDataFilePath(algorithm, problem, M, D, metricName, resultDataFolderPath);
        disp(medianDataFilePath);
        data = load(medianDataFilePath);
        Population = data.result{end};
        Data = Population.(type);
        drawPopulation(Data);
        drawPF(Problem, type);
        titleStr = sprintf('%s on %s', algorithmsName{j}, func2str(problem));
        title(titleStr, 'FontSize', 7);
    end
end
set(gcf,'position',[0,0,3000,3000]); 
printpreview;
% 打印预览，然后手动操作[手动确定大小及位置]->[填满页面]

saveFolderPath = '.\Image\';
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
imageName = sprintf('种群决策空间分布图01');
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end


%% 种群进化过程信息熵、阶段划分图
resultDataFolderPath = '.\DzbResultData\';

algorithm = @ARNSGAIII;
algorithmName = 'AR-NSGA-III';
problems0 = {@DTLZ1, @DTLZ2, @DTLZ3, @DTLZ4, @DTLZ5, @DTLZ6, @DTLZ7};
problems1 = {@MaF1, @MaF2, @MaF3, @MaF4, @MaF5, @MaF6, @MaF7, @MaF8, @MaF9, @MaF10, @MaF11, @MaF12, @MaF13};
problems  = [problems0, problems1];
Ms = zeros(size(problems)) + 4;
[Ds] = getDecDim(problems, Ms);


maxFE = 30000;
save = 20;
for i = 1 : length(problems)
%     platemo('algorithm',algorithm,'problem',problems{i},'M', Ms(i),'maxFE',maxFE,'save',save);
end

row = 7;
col = 3;
for i = 1 : row
    for j = 1 : col
        id = (i-1)*col + j;
        if id > length(problems)
            break;
        end
        subplot(row,col,id);
        M = Ms(id);
        D = Ds(id);
        resultFileName = sprintf('%s_%s_M%d_D%d_Result.mat',func2str(algorithm),func2str(problems{id}),M,D);
        disp(resultFileName);
        data = load([resultDataFolderPath resultFileName]);
        plotEntropy(data.entropyArr, data.entropyDifferenceArr, data.threshold, data.genOfExploration);
        titleStr = sprintf('%s on %s',algorithmName, func2str(problems{id}));
        title(titleStr);

    end
end
legend('e','\Deltae','\mu', '进化阶段分隔线');
        
set(gcf,'position',[0,0,3000,3000]); 
printpreview;
% 打印预览，然后手动操作[手动确定大小及位置]->[填满页面]        

saveFolderPath = '.\Image\';
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
imageName = sprintf('种群进化过程信息熵、阶段划分图');
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end




%%













