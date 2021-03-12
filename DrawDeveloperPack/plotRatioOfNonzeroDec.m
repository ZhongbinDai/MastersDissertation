function plotRatioOfNonzeroDec(ratioMatOfNonzeroDec, algorithmsName, problems, M, D)
    problemsName = cell(size(problems));
    for i = 1 : length(problems)
        problemsName{i} = func2str(problems{i});
    end
    yyaxis left;
    bar(ratioMatOfNonzeroDec);
    xticklabels(problemsName);
    colororder('default');
    xtickangle(30);
    ylabel('非零决策变量的占比','Color','black','FontSize',15);

    yyaxis right;
    t = 0 : length(problemsName) + 1;
    value = zeros(size(t)) + 0.1;
    plot(t, value, 'r--','LineWidth', 2);
    legend([algorithmsName 'Optimal=0.1']);
    ylim([0,1]);
    titleStr = sprintf('M=%d, D=%d', M, D);
    title(titleStr,'FontSize',15);
end

