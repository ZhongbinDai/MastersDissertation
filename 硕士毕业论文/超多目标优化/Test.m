algorithms = {@NSGAII};
problems = {@SMOP1, @SMOP2};
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