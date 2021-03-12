function [medianDataFilePath] = getMedianDataFilePath(algorithm, problem, M, D, metricName, resultDataFolderPath)
    runs = 30;
    metricMat = zeros(1, runs);
    for k = 1 : runs
        [resultDataFilePath] = getResultDataFilePath(algorithm, problem, M, D, k, resultDataFolderPath);
        data = load(resultDataFilePath); 
        disp(resultDataFilePath);
        metric = data.metric.(metricName);
        metricMat(k) = metric(end);
    end
    [B,~] = sort(metricMat);
    Z = ~isnan(B);
    C = B(Z);
    med = C(ceil(length(C)/2));
    ids = find(metricMat == med);
    id = ids(1);
    [medianDataFilePath] = getResultDataFilePath(algorithm, problem, M, D, id, resultDataFolderPath);
end

