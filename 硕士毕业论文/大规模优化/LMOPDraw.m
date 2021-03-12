%% 种群进化IGD指标折线图
resultDataFolderPath = '.\Data\LMOPResult\';
metricName = 'IGD';
algorithms = {@SparseEA, @SparseEAII};
algorithmsName = {'SparseEA', 'SparseEA+Dss'};
problems = {@SMOP5,@SMOP5,@SMOP5,@SMOP5,@SMOP6,@SMOP6,@SMOP6,@SMOP6};
Ms = zeros(size(problems)) + 2;
Ds = [100, 300, 500, 1000, 100, 300, 500, 1000];

row = 2;
col = 4;
set(gcf,'position',[0,0,3000,3000]); 
for i = 1 : row
    for j = 1 : col
        id = (i-1)*col + j;
        subplot(row,col,id);
        problem = problems{id};
        for k = 1 : length(algorithms)
            algorithm = algorithms{k};
            [fes, metricMean] = getMetricMean(algorithm, problem, Ms(id), Ds(id), metricName, resultDataFolderPath);
%             plot(fes, (metricMean),'.-', 'MarkerSize',8,'LineWidth',0.6);
            plot(fes, log(metricMean)/log(100),'.-', 'MarkerSize',8,'LineWidth',0.6);
            hold on;
        end
        titleStr = sprintf('%s (D=%d)', func2str(problem), Ds(id));
        title(titleStr);
        xStr = sprintf('1og\\it_{100}(%s)', metricName);
%         xStr = metricName;
        ylabel(xStr);
        xlabel('Number of function evaluations');
        legend(algorithmsName,'Location','best');
    end
end


saveFolderPath = '.\Image\';
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
imageName = sprintf('种群进化%s指标对比折线图', metricName);
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end


%%
resultDataFolderPath = '.\Data\LMOPResult\';
metricName = 'IGD';
algorithms = {@SparseEA};
algorithmsName = {'SparseEA'};
problems = {@SMOP1,@SMOP1,@SMOP1,@SMOP1,@SMOP4,@SMOP4,@SMOP4,@SMOP4,@SMOP8,@SMOP8,@SMOP8,@SMOP8};
Ms = [2,3,5,10,2,3,5,10,2,3,5,10];
Ds = zeros(size(problems)) + 100;

row = 3;
col = 4;

for i = 1 : row
    for j = 1 : col
        id = (i-1)*col + j;
        subplot(row,col,id);
        problem = problems{id};
        for k = 1 : length(algorithms)
            algorithm = algorithms{k};
            [fes, metricMean] = getMetricMean(algorithm, problem, Ms(id), Ds(id), metricName, resultDataFolderPath);
            plot(fes, (metricMean),'.-', 'MarkerSize',8,'LineWidth',0.6);
%             plot(fes, log(metricMean)/log(100),'.-', 'MarkerSize',8,'LineWidth',0.6);
            hold on;
        end
        titleStr = sprintf('%s (M=%d)', func2str(problem), Ms(id));
        title(titleStr);
%         xStr = sprintf('1og\\it_{100}(%s)', metricName);
        xStr = metricName;
        ylabel(xStr);
        xlabel('Number of function evaluations');
        legend(algorithmsName,'Location','best');
    end
end


set(gcf,'position',[0,0,3000,3000]); 
saveFolderPath = '.\Image\';
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
imageName = sprintf('SparseEA在SMOP1、4、8问题上 M=2,3,5,10 D=100 N=100 种群IGD指标进化折线图');
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end



%% 种群进化IGD指标折线图
resultDataFolderPath = '.\Data\LMOPResult\';
metricName = 'IGD';
algorithms = {@CMOPSO, @MOEADDRA, @NSGAIII, @SparseEA, @SparseNSGAIII2};
algorithmsName =  {'NSGA-III', 'CMOPSO', 'MOEA/D-DRA', 'SparseEA', 'Sparse-NSGA-III'};
problems1 = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
problems2 = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
problems3 = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
problems = [problems1, problems2, problems3];
Ms3 = zeros(size(problems1)) + 3;
Ms5 = zeros(size(problems2)) + 5;
Ms10 = zeros(size(problems3)) + 10;
Ms = [Ms3 Ms5 Ms10];
Ds = zeros(size(problems)) + 500;

row = 6;
col = 4;
% set(gcf,'position',[0,0,3000,3000]); 
for i = 1 : row
    for j = 1 : col
        id = (i-1)*col + j;
        subplot(row,col,id);
        problem = problems{id};
        for k = 1 : length(algorithms)
            algorithm = algorithms{k};
            [fes, metricMean] = getMetricMean(algorithm, problem, Ms(id), Ds(id), metricName, resultDataFolderPath);
            plot(fes, (metricMean),'.-', 'MarkerSize',8,'LineWidth',0.6);
%             plot(fes, log(metricMean)/log(100),'.-', 'MarkerSize',8,'LineWidth',0.6);
            hold on;
        end
        titleStr = sprintf('%s (M=%d)', func2str(problem), Ms(id));
        title(titleStr);
%         xStr = sprintf('1og\\it_{100}(%s)', metricName);
        xStr = metricName;
        ylabel(xStr);
        xlabel('Number of function evaluations', 'FontName','Times New Roman','FontSize',8);
        
    end
end
legend(algorithmsName,'Location','best', 'FontName','Times New Roman','FontSize',11,'FontWeight','normal','Orientation','horizon');

set(gcf,'position',[0,0,3000,3000]); 
printpreview;
% 打印预览，然后手动操作[手动确定大小及位置]->[填满页面]

saveFolderPath = '.\Image\';
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
imageName = sprintf('SMOP1-8 M=3,5,10 种群进化%s指标对比折线图', metricName);
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end


%% 盒图
resultDataFolderPath = '.\Data\LMOPResult\';
metricName = 'IGD';
algorithms = {@CMOPSO, @MOEADDRA, @NSGAIII, @SparseEA, @SparseNSGAIII2};
algorithmsName =  {'NSGA-III', 'CMOPSO', 'MOEA/D-DRA', 'SparseEA', 'Sparse-NSGA-III'};
problems1 = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
problems2 = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
problems3 = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
problems = [problems1, problems2, problems3];
Ms3 = zeros(size(problems1)) + 3;
Ms5 = zeros(size(problems2)) + 5;
Ms10 = zeros(size(problems3)) + 10;
Ms = [Ms3 Ms5 Ms10];
Ds = zeros(size(problems)) + 500;

row = 6;
col = 4;

for i = 1 : row
    for j = 1 : col
        id = (i-1)*col + j;
        subplot(row,col,id);
        [metricsMatrix] = getMetricsMatrix(algorithms, problems{id}, Ms(id), Ds(id), metricName, resultDataFolderPath);
        boxplot(metricsMatrix', algorithmsName);
        titleStr = sprintf('%s (M=%d)', func2str(problems{id}), Ms(id));
        title(titleStr);
        ylabel(metricName);
        xtickangle(30);
    end
end
set(gcf,'position',[0,0,3000,3000]); 
printpreview;
% 打印预览，然后手动操作[手动确定大小及位置]->[填满页面]

saveFolderPath = '.\Image\';
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
imageName = sprintf('SMOP1-8 M=3,5,10 各算法在%s指标箱形图', metricName);
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end


%% 非零决策变量的占比直方图(稀疏度图)
resultDataFolderPath = '.\Data\LMOPResult\';
metricName = 'IGD';
algorithms = {@CMOPSO, @MOEADDRA, @NSGAIII, @SparseEA, @SparseNSGAIII2};
algorithmsName =  {'NSGA-III', 'CMOPSO', 'MOEA/D-DRA', 'SparseEA', 'Sparse-NSGA-III'};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};

Ms = [3 5 10];
D = 500;

row = 1;
col = length(Ms);
for i = 1 : row
    for j = 1 : col
        id = (i-1)*col + j;
        subplot(row,col,id);
        M = Ms(id);
        ratioMatOfNonzeroDec = getRatioMatOfNonzeroDec(algorithms, problems, M, D, metricName, resultDataFolderPath);
        plotRatioOfNonzeroDec(ratioMatOfNonzeroDec, algorithmsName, problems, M, D);
    end
end


saveFolderPath = '.\Image\';
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
imageName = sprintf('非零决策变量的占比直方图');
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end

%%










