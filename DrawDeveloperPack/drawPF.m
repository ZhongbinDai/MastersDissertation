function drawPF(Problem, type)
    if strcmp(type,'objs')
        hold on;
        if Problem.M == 2
            plot(Problem.PF(:,1),Problem.PF(:,2),'-k','LineWidth',1);
        elseif Problem.M == 3
            surf(Problem.PF{1},Problem.PF{2},Problem.PF{3},'EdgeColor',[.8 .8 .8],'FaceColor','none');
        end
    end

    
end

