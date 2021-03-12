%% M=3 N=105
algorithms = {@SparseEA, @SparseNSGAIII2};
problems = {@SMOP3};
Ms = zeros(size(problems)) + 3;
Ns = zeros(size(problems)) + 105;
Ds = zeros(size(problems)) + 500;



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




%% M=5 N=126 D=500
algorithms = {@NSGAIII, @SparseEA, @SparseNSGAIII2};
problems = {@SMOP1, @SMOP2, @SMOP4, @SMOP5, @SMOP6};
Ms = zeros(size(problems)) + 5;
Ns = zeros(size(problems)) + 126;
Ds = zeros(size(problems)) + 500;



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
algorithms = {@MOEADDRA, @SparseNSGAIII2};
problems = {@SMOP4};
Ms = zeros(size(problems)) + 10;
Ns = zeros(size(problems)) + 220;
Ds = zeros(size(problems)) + 500;



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

%%





