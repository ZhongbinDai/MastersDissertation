%% 批量实验 D=100
algorithms = {@NSGAII, @NSGAIII, @SparseEA, @SparseEAII};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 2;
Ds = zeros(size(problems)) + 100;


save = 20;
runs = 30;
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end

%% 批量实验 M=3
algorithms = {@NSGAII, @NSGAIII, @SparseEA, @SparseEAII};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 3;
Ds = zeros(size(problems)) + 100;


save = 20;
runs = 30;
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end

%% 批量实验 M=5
algorithms = {@NSGAII, @NSGAIII, @SparseEA, @SparseEAII};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 5;
Ds = zeros(size(problems)) + 100;


save = 20;
runs = 30;
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end

%% 批量实验 M=10
algorithms = {@NSGAII, @NSGAIII, @SparseEA, @SparseEAII};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 10;
Ds = zeros(size(problems)) + 100;


save = 20;
runs = 30;
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end


%% 批量实验 D=300
algorithms = {@NSGAII, @NSGAIII, @SparseEA, @SparseEAII};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 2;
Ds = zeros(size(problems)) + 300;


save = 20;
runs = 30;
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end

%% 批量实验 D=500
algorithms = {@NSGAII, @NSGAIII, @SparseEA, @SparseEAII};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 2;
Ds = zeros(size(problems)) + 500;


save = 20;
runs = 30;
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end


%% 批量实验 D=1000
algorithms = {@NSGAII, @NSGAIII, @SparseEA, @SparseEAII};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 2;
Ds = zeros(size(problems)) + 1000;


save = 20;
runs = 30;
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end


%% 批量计算结果文件指标，若已有指标直接读取，若无先计算再写入
% resultDataFolderPath = '.\Data\';
% metricName = 'IGD';
% algorithms = {@NSGAII, @NSGAIII, @SparseEA, @SparseEAII};
% problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
% Ms = zeros(size(problems)) + 2;
% Ds = zeros(size(problems)) + 100;
% 
% 
% parfor i = 1 : length(problems)
%     [metricsMatrix] = computeMetricsMatrix(algorithms, problems{i}, Ms(i), Ds(i), metricName, resultDataFolderPath);
% end
