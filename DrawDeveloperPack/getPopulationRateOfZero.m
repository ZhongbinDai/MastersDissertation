function [rateOfZero] = getPopulationRateOfZero(resultDataFilePath)
    data = load(resultDataFilePath);
    sum = 0;
    sumOfZero = 0;
    population = data.result{end};
    for i = 1 : length(population)
        individual = population(i);
        decOfIndividual = individual.dec;
        num = length(decOfIndividual);
        numOfZero = length(find(decOfIndividual == 0));
        sum = sum + num;
        sumOfZero = sumOfZero + numOfZero;
%         fprintf('%d %d\n',numOfZero, num);
    end
    rateOfZero = sumOfZero / sum;
end

