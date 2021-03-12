function [dec, obj] = getPopulationDecAndObj(Population)
%��ȡ��Ⱥ�ľ���������Ŀ������
    [~,N] = size(Population);
    [~,M] = size(Population(1).dec);
    dec = zeros(N,M);
    for i=1:N
        X = Population(i).dec;
        dec(i,:) = X;
    end
    
    [~,M] = size(Population(1).obj);
    obj = zeros(N,M);
    for i=1:N
        X = Population(i).obj;
        obj(i,:) = X;
    end
    
end

