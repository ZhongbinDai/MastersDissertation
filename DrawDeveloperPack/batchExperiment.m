%% 批量实验 -4D
% 初始化
algorithms = {@NSGAIII, @MaOEAIGD, @MaOEAIT, @MaOEARD, @ARNSGAIII};
problems0 = {@DTLZ1, @DTLZ2, @DTLZ3, @DTLZ4, @DTLZ5, @DTLZ6, @DTLZ7};
problems1 = {@MaF1, @MaF2, @MaF3, @MaF4, @MaF5, @MaF6, @MaF7, @MaF8, @MaF9, @MaF10, @MaF11, @MaF12, @MaF13};
problems  = [problems0, problems1];

Ms = zeros(1, length(problems)) + 4;

maxFE = 30000;
save = 30;

% 跑实验
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        for k = 1 : 30
            platemo('algorithm',algorithms{i},'problem',problems{j},'M', Ms(j),'maxFE',maxFE,'save',save);
        end
    end
end

% 计算指标
resultDataFolderPath = '.\Data\';
metricsName = {'IGD', 'HV', 'Spread'};
Ds = getDecDim(problems, Ms);

for i = 1 : length(problems)
    for j = 1 : length(metricsName)
        printf('计算%s...\n',metricsName{j});
        [metricsMatrix] = computeMetricsMatrix(algorithms, problems{i}, Ms(i), Ds(i), metricsName{j}, resultDataFolderPath);
    end
end


%% 批量实验 -5D
% 初始化
algorithms = {@NSGAIII, @MaOEAIGD, @MaOEAIT, @MaOEARD, @ARNSGAIII};
problems0 = {@DTLZ1, @DTLZ2, @DTLZ3, @DTLZ4, @DTLZ5, @DTLZ6, @DTLZ7};
problems1 = {@MaF1, @MaF2, @MaF3, @MaF4, @MaF5, @MaF6, @MaF7, @MaF8, @MaF9, @MaF10, @MaF11, @MaF12, @MaF13};
problems  = [problems0, problems1];
Ms = zeros(1, length(problems)) + 5;

maxFE = 30000;
save = 30;

% 跑实验
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        for k = 1 : 30
            platemo('algorithm',algorithms{i},'problem',problems{j},'M', Ms(j),'maxFE',maxFE,'save',save);
        end
    end
end

% 计算指标
resultDataFolderPath = '.\Data\';
metricsName = {'IGD', 'HV', 'Spread'};
Ds = getDecDim(problems, Ms);

for i = 1 : length(problems)
    for j = 1 : length(metricsName)
        printf('计算%s...\n',metricsName{j});
        [metricsMatrix] = computeMetricsMatrix(algorithms, problems{i}, Ms(i), Ds(i), metricsName{j}, resultDataFolderPath);
    end
end

%%
% 指标比较表
% 指标盒图
% 指标进化折线图
% 种群目标空间分布图
% 种群决策空间分布图




