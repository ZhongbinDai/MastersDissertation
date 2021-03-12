classdef ARNSGAIII < ALGORITHM
% <multi/many> <real/binary/permutation> <constrained/none>
% ���ڲο���ѡ����ԵĸĽ���NSGA-III�㷨

%------------------------------- Reference --------------------------------
% ����ͬ,���б�,������,���, ��.���ڲο���ѡ����ԵĸĽ���NSGA-III�㷨[J].ģʽʶ�����˹�����,2020.

%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    methods
        function main(Algorithm,Problem)
            %% Generate the reference points and random population
            
            [Z, numOfReferencePoint] = DzbUniformPoint(Problem.N * 1.19, Problem.M);	%��ʼ���ο�����Ŀ>=N*1.20,�����д��>N*1.19
            
            Population   = Problem.Initialization();     %��ʼ����Ⱥ

            M = Problem.M;                               %Ŀ����
            N = Problem.N;                               %��Ⱥ��ģ
            D = Problem.D;                               %���߱���ά��
            ub =  Problem.upper;                         %���߱����Ͻ�
            lb = Problem.lower;                          %���߱����½�
            Gmax = ceil(Problem.maxFE / Problem.N);        %��Ⱥ����������
            
            threshold = D*((0.5+1/N)*log10(0.5+1/N)-0.5*log10(0.5));    %��Ⱥ�����׶���ֵ
            fprintf('��ֵ��%f\n',threshold);


            [dec, ~] = getPopulationDecAndObj(Population);              %��ȡ��Ⱥ�ľ�������
            X = sort(dec);                                              %�Ծ�������ÿ��ά�Ƚ�������
            mid = X(int32(N*2/4),:);                                    %��������ÿ��ά�ȵ���λ��

            i=1;
            entropyArr = zeros(1,Gmax);                                 %�����洢ÿ����Ⱥ����
            entropyDifferenceArr = zeros(1,Gmax);                                %�����洢����������Ⱥ���ز�
            entropy = getEntropy(Population, ub, lb, mid);              %������
            entropyArr(i) = entropy;

            Zmin = min(Population(all(Population.cons<=0,2)).objs,[],1);
            
            totalOfRPointAssociation = [0];                             %ÿ���ο�������ĸ�����ͳ��ֵ
            Dsum = 0;                                                   %ͳ���ز�С����ֵ���ֵĴ���
            flag = 0;                                                   %�ж��Ƿ��Ѿ����вο���ɾ�������ı��
            fprintf('Dzb��Ⱥ����%d\tԭʼ�ο�������%d\t�����ο�������%d\n',Problem.N,numOfReferencePoint,Problem.N);
            genOfExploration = 0;
            %% Optimization
            while Algorithm.NotTerminated(Population)
                MatingPool = TournamentSelection(2,Problem.N,sum(max(0,Population.cons),2));
                Offspring  = OperatorGA(Population(MatingPool));
                Zmin       = min([Zmin;Offspring(all(Offspring.cons<=0,2)).objs],[],1);
                [Population, rho] = EnvironmentalSelection([Population,Offspring],Problem.N,Z,Zmin);
                
                totalOfRPointAssociation = totalOfRPointAssociation + rho;  %ͳ�Ʋο�������ĸ�����������rhoΪÿһ���ο�������ĸ�����Ŀ
                
                i=i+1;
                entropy = getEntropy(Population, ub, lb, mid);              %�������Ⱥ���߱�������
                entropyArr(i) = entropy;
                entropyDifferenceArr(i) = abs(entropyArr(i-1) - entropyArr(i));      %��������������Ⱥ���ز�

                %����ز�С����ֵ
                if entropyDifferenceArr(i) < threshold
                    Dsum = Dsum + 1;
                end


                [dec, ~] = getPopulationDecAndObj(Population);              %��ȡ��Ⱥ�ľ�������
                X = sort(dec);                                              %�Ծ�������ÿ��ά�Ƚ�������
                mid = X(int32(N*2/4),:);                                    %��������ÿ��ά�ȵ���λ��


        %         if Global.evaluated >= Global.evaluation / 2 && flag == 0
                %�ο���ɸѡ����
                
                if Dsum >= 10 && flag == 0
                    genOfExploration = i;
                    fprintf('��%d�����롰̽���ס���\n', genOfExploration);
                    flag = flag + 1;
                    numOfDel = numOfReferencePoint - N;                     %����ɾ���Ĳο�����Ŀ
                    k=0;
                    while k < numOfDel
                        [~,n]=min(totalOfRPointAssociation);                %��ȡ����������Ŀ���ٵĲο���
                        totalOfRPointAssociation(n) = [];
                        Z(n,:)=[];                                          %ɾ���ο���
                        k = k + 1;
                    end
        %             save('Zn.mat','Z');
        %             fprintf('�����ο�������%d\n',size(Z,1));
                end
                
                if i == Gmax
                    resultDataFolderPath = '.\DzbResultData\';
                    resultFileName = sprintf('%s_%s_M%d_D%d_Result.mat',class(Algorithm),class(Problem),Problem.M,Problem.D);
                    save([resultDataFolderPath resultFileName], 'genOfExploration', 'threshold', 'entropyArr','entropyDifferenceArr');
                    
%                     save('genOfExploration.mat', 'genOfExploration');
%                     save('threshold.mat','threshold');
%                     save('entropyArr.mat','entropyArr');
%                     save('entropyDifferenceArr.mat','entropyDifferenceArr');
%                     disp(genOfExploration);
                    fprintf('����ɹ�\n');
                end
                
                
            end
            
            
        end
    end
end

