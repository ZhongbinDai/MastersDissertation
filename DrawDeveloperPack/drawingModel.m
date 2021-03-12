%% 提取不同算法在同一个问题上的指标，一个算法指标一行（默认一行30个）
resultDataFolderPath = 'C:\Users\12098\Desktop\硕士毕业论文\代码\PlatEMO 3.0\PlatEMO\Data\';
metricName = 'Spread';
algorithms = {@NSGAIII, @MaOEAIGD, @MaOEAIT, @MaOEARD, @ARNSGAIII};
algorithmsName = {'NSGA-III', 'MaOEA-IGD', 'MaOEA-IT', 'MaOEA-R&D', 'AR-NSGA-III'};
problem = @MaF6;
M = 4;
D = 13;

[metricsMatrix] = getMetricsMatrix(algorithms, problem, M, D, metricName, resultDataFolderPath);       % 从各mat数据中提取数据汇总

boxplot(metricsMatrix', algorithmsName);                                    % 绘制盒图
title(func2str(problem));
ylabel(metricName);
xtickangle(30);                                                             % X轴字符串旋转30度

set(gca,'looseInset',[0 0 0 0]);                                            % plot图去白边

% 图片储存
saveFolderPath = '.\Image\';
imageName = sprintf('%s_M%d_D%d_%s',func2str(problem),M,D,metricName);
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end

%% 批量出盒图
resultDataFolderPath = 'C:\Users\12098\Desktop\硕士毕业论文\代码\PlatEMO 3.0\PlatEMO\Data\20210221\';
metricName = 'IGD';
algorithms = {@NSGAIII, @MaOEAIGD, @MaOEAIT, @MaOEARD, @ARNSGAIII};
algorithmsName = {'NSGA-III', 'MaOEA-IGD', 'MaOEA-IT', 'MaOEA-R&D', 'AR-NSGA-III'};
problems0 = {@DTLZ1, @DTLZ2, @DTLZ3, @DTLZ4, @DTLZ5, @DTLZ6, @DTLZ7};
problems1 = {@MaF1, @MaF2, @MaF3, @MaF4, @MaF5, @MaF6, @MaF7, @MaF8, @MaF9, @MaF10, @MaF11, @MaF12, @MaF13};
problems  = [problems0, problems1];
M0 = [4	4	5	4	4	5	4];
M1 = [4	4	4	4	4	4	5	5	5	5	5	4	5];
Ms = [M0, M1];
[Ds] = getDecDim(problems, Ms);
% D0 = [8	13 14 13 13 14 23];
% D1 = [13 13 13 13 13 13 24 2 2 14 14 13 5];
% Ds = [D0, D1];

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

saveFolderPath = '.\Image\';
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath metricName saveFileTypes{i}]);
end

%% 针对AR-NSGA-III算法出种群决策空间信息熵图
load('threshold.mat');
load('genOfExploration.mat');                                               % 种群进化阶段划分
load('entropyArr.mat');                                                     % 种群决策空间信息熵
load('entropyDifferenceArr.mat');                                           % 相邻两代种群决策空间信息熵差值

plotEntropy(entropyArr, entropyDifferenceArr, threshold, genOfExploration);

set(gca,'looseInset',[0 0 0 0]);                                            % plot图去白边

% 图片储存
problem = @MaF6;
saveFolderPath = '.\Image\';
imageName = sprintf('%s_populationDecEntropy', func2str(problem));
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end

%% 跑实验，种群目标空间分布图
algorithm = @NSGAIII;
problem = @DTLZ7;
M = 3;
maxFE = 10000;
save = 0;
platemo('algorithm',algorithm,'problem',problem,'M',M,'maxFE',maxFE,'save', save);           % 出图
pro = problem('M', M);

set(gca,'looseInset',[0 0 0 0]);                                            % plot图去白边
saveFolderPath = '.\Image\';
imageName = sprintf('%s_%s_M%d_D%d_E%d',func2str(algorithm), func2str(problem),pro.M,pro.D,maxFE);
saveFileTypes = {'.png'; '.svg'; '.eps'; '.emf'};
for i = 1 : length(saveFileTypes)
    saveas(gcf, [saveFolderPath imageName saveFileTypes{i}]);
end

%% 计算种群指标（一个算法，一个文件，多个进化代数），出折线图
resultDataFolderPath = 'C:\Users\12098\Desktop\硕士毕业论文\代码\PlatEMO 3.0\PlatEMO\Data\';
algorithm = @ARNSGAIII;
problem = @DTLZ7;
metricName = 'IGD';
M = 4;
D = 23;
k = 1;

pro = problem('M', M, 'D', D);
[resultDataFilePath] = getResultDataFilePath(algorithm, problem, M, D, k, resultDataFolderPath);
disp(resultDataFilePath);
load(resultDataFilePath);

FE = cell2mat(result(:,1));                                                 % 将元胞数组转换为基础数据类型的普通数组
metrics = cellfun(@(S)feval(metricName,S,pro.optimum), result(:,2));

plot(FE, metrics, '-*');
titleStr = sprintf('%s on %s', func2str(algorithm), func2str(problem));
title(titleStr);
ylabel(metricName);
xlabel('Number offunction evaluations');

%% 绘制种群目标空间、决策空间图
resultDataFolderPath = 'C:\Users\12098\Desktop\硕士毕业论文\代码\PlatEMO 3.0\PlatEMO\Data\';
algorithm = @NSGAIII;
problem = @DTLZ1;
M = 4;
D = 8;
k = 26;

Problem = problem('M', M, 'D', D);
[resultDataFilePath] = getResultDataFilePath(algorithm, problem, M, D, k, resultDataFolderPath);
disp(resultDataFilePath);
data = load(resultDataFilePath);

Population = data.result{end};
Problem.DrawObj(Population);                                                % 种群目标空间图
titleStr = sprintf('%s on %s (Object Space)', func2str(algorithm), func2str(problem));
title(titleStr,'Interpreter','none');

Problem.DrawDec(Population);                                                % 种群决策空间图
titleStr = sprintf('%s on %s (Decision Space)', func2str(algorithm), func2str(problem));
title(titleStr,'Interpreter','none');



%% 2D 种群在目标空间分布对比图
resultDataFolderPath = '.\Data\';
algorithms = {@MaOEAIT, @MaOEARD};
algorithmsName = {'PF', 'MaOEA-IT', 'MaOEA-R&D'};
problem = @DTLZ1;
M = 2;
D = getDecDim({problem}, M);
k = 1;

% for i = 1 : length(algorithms)
%     platemo('algorithm',algorithms{i},'problem',problem,'M',M,'maxFE',20000,'save', 20);
% end

hold on;
Problem = problem('M', M, 'D', D);
plot(Problem.PF(:,1),Problem.PF(:,2),'-k','LineWidth',1);                   % 前沿面
varargin = {'o','+','s','*','^','x'};
for i = 1 : length(algorithms)
    [resultDataFilePath] = getResultDataFilePath(algorithms{i}, problem, M, D, k, resultDataFolderPath);
    disp(resultDataFilePath);
    data = load(resultDataFilePath);
    Population = data.result{end};
    objs = Population.objs;
    plot(objs(:,1),objs(:,2),varargin{i});
end

titleStr = sprintf('%s on %s (Object Space)', 'Population', func2str(problem));
title(titleStr,'Interpreter','none');
legend(algorithmsName,'Location','best');

%% 3D 种群在目标空间分布对比图
resultDataFolderPath = '.\Data\';
algorithms = {@NSGAIII};
algorithmsName = {'NSGA-III'};
problem = @DTLZ1;
M = 3;
D = getDecDim({problem}, M);
k = 1;

% for i = 1 : length(algorithms)
%     platemo('algorithm',algorithms{i},'problem',problem,'M',M,'maxFE',20000,'save', 20);
% end

hold on;
Problem = problem('M', M, 'D', D);

surf(Problem.PF{1},Problem.PF{2},Problem.PF{3},'EdgeColor',[.8 .8 .8],'FaceColor','none');  % 前沿面
view([135 30]);


varargin = {'o','+','s','*','^','x'};
for i = 1 : length(algorithms)
    [resultDataFilePath] = getResultDataFilePath(algorithms{i}, problem, M, D, k, resultDataFolderPath);
    disp(resultDataFilePath);
    data = load(resultDataFilePath);
    Population = data.result{end};
    objs = Population.objs;
    plot3(objs(:,1),objs(:,2),objs(:,3),varargin{i});
end

titleStr = sprintf('%s on %s (Object Space)', 'Population', func2str(problem));
title(titleStr,'Interpreter','none');
legend(algorithmsName,'Location','best');



