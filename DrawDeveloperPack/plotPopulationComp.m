function plotPopulationComp(problem, M, D, Population1, Population2)
    type = 'objs';

    Data1 = Population1.(type);
    Data2 = Population2.(type);
    dim = size(Data1, 2);
    Problem = problem('M', M, 'D', D);
    set(gca,'NextPlot','add','Box','on');
%     set(gca,'NextPlot','add','Box','on','GridLineStyle','none');
    xlabel('\it f\rm_1');
    ylabel('\it f\rm_2');
    if dim == 2
        plot(Data1(:,1),Data1(:,2),'o', Data2(:,1),Data2(:,2),'*'); 

    elseif dim == 3
        plot3(Data1(:,1),Data1(:,2),Data1(:,3),'o',Data2(:,1),Data2(:,2),Data2(:,3),'*');
%         view([135 30]);
        view([20 10]);
        zlabel('\it f\rm_3');
    end
    drawPF(Problem, type);
    titleStr = sprintf('100个体的初始化种群 (%s,M=%d,D=%d)',func2str(problem),M,D);
    title(titleStr,'FontSize',15);
    axis('tight');
end

