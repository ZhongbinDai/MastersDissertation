function [confusionMatrix] = getConfusionMatrix(actualLabel, predictLabel)
% ∫·÷·‘§≤‚£ª ˙÷·’Ê µ£ª
    minId = min([actualLabel; predictLabel]);
    maxId = max([actualLabel; predictLabel]);
    numOfClass = maxId - minId + 1;
    actualLabel = actualLabel - minId + 1;
    predictLabel = predictLabel - minId + 1;
    confusionMatrix = zeros(numOfClass);
    numOfSample = length(actualLabel);
    for i = 1 : numOfSample
        confusionMatrix(actualLabel(i), predictLabel(i)) = confusionMatrix(actualLabel(i), predictLabel(i)) + 1;
    end
end

