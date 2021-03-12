function [resultDataFilePath] = getResultDataFilePath(algorithm, problem, M, D, k, resultDataFolderPath)
    resultDataFileName = getResultDataFileName(algorithm, problem, M, D, k);
    resultDataFilePath = [resultDataFolderPath func2str(algorithm) '\' resultDataFileName];
end

