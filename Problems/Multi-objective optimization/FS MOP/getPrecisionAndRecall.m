function [precision, recall] = getPrecisionAndRecall(actualLabel, predictLabel)
    confusionMatrix = getConfusionMatrix(actualLabel, predictLabel);

    sumOfCol = sum(confusionMatrix, 1);                 % 按列求和
    sumOfLow = sum(confusionMatrix, 2);                 % 按行求和
    numOfClass = size(confusionMatrix, 1);

    precisions = zeros(numOfClass, 1);
    for i = 1 : numOfClass
        if confusionMatrix(i, i) == 0
            if sumOfCol(i) == 0
                precisions(i) = 1;
            else
                precisions(i) = 0;
            end
        else
            precisions(i) = confusionMatrix(i, i) / sumOfCol(i);
        end
    end
    precision = mean(precisions);

    recalls = zeros(numOfClass, 1);
    for i = 1 : numOfClass
        if confusionMatrix(i, i) == 0
            if sumOfLow(i) == 0
                recalls(i) = 1;
            else
                recalls(i) = 0;
            end
        else
            recalls(i) = confusionMatrix(i, i) / sumOfLow(i);
        end
    end
    recall = mean(recalls);
end

