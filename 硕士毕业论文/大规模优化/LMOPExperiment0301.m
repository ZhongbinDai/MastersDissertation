%% M=3 N=105
algorithms = {@CMOPSO, @MOEADDRA, @NSGAIII, @SparseEA, @SparseNSGAIII2};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 3;
Ns = zeros(size(problems)) + 105;
Ds = zeros(size(problems)) + 500;



save = 20;
runs = 30;
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'N',Ns(j),'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end


%% M=5 N=126
algorithms = {@CMOPSO, @MOEADDRA, @NSGAIII, @SparseEA, @SparseNSGAIII2};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 5;
Ns = zeros(size(problems)) + 126;
Ds = zeros(size(problems)) + 500;



save = 20;
runs = 30;
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'N',Ns(j),'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end

%% M=10 N=220
algorithms = {@CMOPSO, @MOEADDRA, @NSGAIII, @SparseEA, @SparseNSGAIII2};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 10;
Ns = zeros(size(problems)) + 220;
Ds = zeros(size(problems)) + 500;



save = 20;
runs = 30;
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'N',Ns(j),'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end

%% 
% 图 SparseEA在SMOP1、4、8问题上
% M=3,5,10 D=100 N=100
algorithms = {@SparseEA};
problems = {@SMOP1,@SMOP4,@SMOP8,@SMOP1,@SMOP4,@SMOP8,@SMOP1,@SMOP4,@SMOP8};
Ms = [3,3,3,5,5,5,10,10,10];
Ns = zeros(size(Ms)) + 100;
Ds = zeros(size(Ms)) + 100;


save = 20;
runs = 30;

for i = 1 : length(algorithms)
    parfor j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'N',Ns(j),'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end

%%
algorithms = {@SparseEA, @SparseEAII};
problems = {@SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8};
Ms = zeros(size(problems)) + 2;
Ns = zeros(size(problems)) + 100;
Ds = zeros(size(problems)) + 100;


save = 20;
runs = 30;
for i = 1 : length(algorithms)
    parfor j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'N',Ns(j),'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end

%%
algorithms = {@SparseEA, @SparseEAII};
problems = {@SMOP5, @SMOP6,@SMOP5, @SMOP6,@SMOP5, @SMOP6};
Ms = zeros(size(problems)) + 2;
Ns = zeros(size(problems)) + 100;
Ds = [300,500,1000,300,500,1000];


save = 20;
runs = 30;
for i = 1 : length(algorithms)
    parfor j = 1 : length(problems)
        maxFE = Ds(j) * 100;
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'N',Ns(j),'M', Ms(j),'D', Ds(j),'maxFE',maxFE,'save',save);
        end
    end
end
