function [resultDataFileName] = getResultDataFileName(algorithm, problem, M, D, k)
    resultDataFileName = sprintf('%s_%s_M%d_D%d_%d.mat',func2str(algorithm),func2str(problem),M,D,k);
end