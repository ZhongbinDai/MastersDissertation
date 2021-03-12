function [metricsMatrix] = computeMetricsMatrix(algorithms, problem, M, D, metricName, resultDataFolderPath)
    n = 30;
    num = length(algorithms);
    metricsMatrix = zeros(num, n);
    pro = problem('M', M, 'D', D);
    for i = 1 : num
        algorithm = algorithms{i};
        for k = 1 : n
            [resultDataFilePath] = getResultDataFilePath(algorithm, problem, M, D, k, resultDataFolderPath);
            disp(resultDataFilePath);
            load(resultDataFilePath);
            if isfield(metric,metricName)
                metrics = metric.(metricName);
            else
                metrics = cellfun(@(S)feval(metricName,S,pro.optimum), result(:,2));
                metric.(metricName) = metrics;
                save(resultDataFilePath, 'metric', '-append');
            end
            metricsMatrix(i, k) = metrics(end);
        end
    end
end

