%% M=3 N=105
algorithms = {@CMOPSO, @MOEADDRA, @NSGAIII, @SparseEA, @SparseNSGAIII2};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 3;
Ns = zeros(size(problems)) + 105;
Ds = zeros(size(problems)) + 200;



save = 20;
runs = 30;
for i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        parfor k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'N',Ns(j),'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end


%% M=5 N=126
algorithms = {@CMOPSO, @MOEADDRA, @NSGAIII, @SparseEA, @SparseNSGAIII2};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 5;
Ns = zeros(size(problems)) + 126;
Ds = zeros(size(problems)) + 200;



save = 20;
runs = 30;
for i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        parfor k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'N',Ns(j),'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end

%% M=10 N=220
algorithms = {@CMOPSO, @MOEADDRA, @NSGAIII, @SparseEA, @SparseNSGAIII2};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 10;
Ns = zeros(size(problems)) + 220;
Ds = zeros(size(problems)) + 200;



save = 20;
runs = 30;
for i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        parfor k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'N',Ns(j),'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end
