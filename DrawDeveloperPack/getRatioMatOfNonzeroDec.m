function ratioMatOfNonzeroDec = getRatioMatOfNonzeroDec(algorithms, problems, M, D, metricName, resultDataFolderPath)
%     k = 1;
    ratioMatOfNonzeroDec = zeros(length(problems), length(algorithms));
    problemsName = cell(size(problems));
    for i = 1 : length(problems)
        problem = problems{i};
        problemsName{i} = func2str(problem);
        for j = 1 : length(algorithms)
            algorithm = algorithms{j};
%             [medianDataFilePath] = getResultDataFilePath(algorithm, problem, M, D, k, resultDataFolderPath);
            [medianDataFilePath] = getMedianDataFilePath(algorithm, problem, M, D, metricName, resultDataFolderPath);
            disp(medianDataFilePath);
            rateOfZero = getPopulationRateOfZero(medianDataFilePath);
            ratioMatOfNonzeroDec(i, j) = 1 - rateOfZero;
        end
    end
end

