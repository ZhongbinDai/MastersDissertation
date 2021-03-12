function [metricsMatrix] = getMetricsMatrix(algorithms, problem, M, D, metricName, resultDataFolderPath)
% 多个文件，最后一代种群指标
	n = 30;
    num = length(algorithms);
    metricsMatrix = zeros(num, n);
    for i = 1 : num
        algorithm = algorithms{i};
        for k = 1 : n
            resultDataFilePath = getResultDataFilePath(algorithm, problem, M, D, k, resultDataFolderPath);
            disp(resultDataFilePath);
            data = load(resultDataFilePath);
            metricsMatrix(i, k) = data.metric.(metricName)(end);
        end
    end
end

