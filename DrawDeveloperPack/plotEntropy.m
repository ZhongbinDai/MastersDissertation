function plotEntropy(entropyArray, entropyDifferenceArr, threshold, genOfExploration)
% 针对AR-NSGA-III算法出种群决策空间信息熵图
    [~, dim] = size(entropyDifferenceArr);
    x = (2:dim);
    X = entropyArray(2: dim);
    Y = entropyDifferenceArr(2:end);
    Z = Y + threshold - Y;
    plot(x, X, 'r--', x, abs(Y),'b:', x, Z, 'g','LineWidth',1.5);
    
    
    
    xlabel('进化代数');
%     legend('e','\Deltae','\mu');
    
    hold on;
    maxEntropy = max(entropyArray);
    plot([genOfExploration, genOfExploration],[0, maxEntropy], 'k', 'LineWidth',1.5);
%     legend('e','\Deltae',['\mu=' num2str(threshold)], '进化阶段分隔线');
    
end

