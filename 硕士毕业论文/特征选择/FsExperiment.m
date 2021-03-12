algorithms = {@NSGAII, @SparseEA, @SparseNSGAIII2, @SparseEAII};
problems = {@Sparse_FS1,@Sparse_FS2,@Sparse_FS3,@Sparse_FS4};



N = 105;
maxFE = 25000;
save = 20;
runs = 30;
parfor i = 1 : length(algorithms)
    for j = 1 : length(problems)
        for k = 1 : runs
            platemo('algorithm',algorithms{i},'problem',problems{j},'N', N,'maxFE',maxFE,'save',save);

        end
    end
end

%%

