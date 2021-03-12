function [Ds] = getDecDim(problems, Ms)
    Ds = zeros(size(Ms));
    for i = 1 : length(Ms)
        problem = problems{i};
        pro = problem('M', Ms(i));
        Ds(i) = pro.D;
    end
end

