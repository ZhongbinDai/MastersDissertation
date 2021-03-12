function [fes, metricMean] = getMetricMean(algorithm, problem, M, D, metricName, resultDataFolderPath)
    runs = 30;
    n = 0;
    metricSum = 0;
    for k = 1 : runs
        [resultDataFilePath] = getResultDataFilePath(algorithm, problem, M, D, k, resultDataFolderPath);
        data = load(resultDataFilePath); 
        disp(resultDataFilePath);
        metric = data.metric.(metricName);
        if ~isnan(metric)
            metricSum = metricSum + metric;
            n = n + 1;
        end
        fes = cell2mat(data.result(:, 1));
    end
    metricMean = metricSum / n;
end

