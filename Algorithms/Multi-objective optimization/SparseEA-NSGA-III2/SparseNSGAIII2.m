classdef SparseNSGAIII2 < ALGORITHM
% <multi> <real/binary> <large/none> <constrained/none> <sparse>
% Evolutionary algorithm for sparse multi-objective optimization problems

%------------------------------- Reference --------------------------------
% Y. Tian, X. Zhang, C. Wang, and Y. Jin, An evolutionary algorithm for
% large-scale sparse multi-objective optimization problems, IEEE
% Transactions on Evolutionary Computation, 2020, 24(2): 380-393.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2021 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    methods
        function main(Algorithm,Problem)
            
            [Z,Problem.N] = UniformPoint(Problem.N,Problem.M);              % 产生参考点
            
            %% Calculate the fitness of each decision variable 为每维决策变量打分
            TDec    = [];
            TMask   = [];
            TempPop = [];
            Fitness = zeros(1,Problem.D);
            REAL    = ~strcmp(Problem.encoding,'binary');
            for i = 1 : 1+4*REAL
                if REAL
                    Dec = unifrnd(repmat(Problem.lower,Problem.D,1),repmat(Problem.upper,Problem.D,1));
                else
                    Dec = ones(Problem.D,Problem.D);
                end
                Mask       = eye(Problem.D);
                Population = SOLUTION(Dec.*Mask);
                TDec       = [TDec;Dec];
                TMask      = [TMask;Mask];
                TempPop    = [TempPop,Population];
                Fitness    = Fitness + NDSort([Population.objs,Population.cons],inf);
            end
            %% Generate initial population 根据每维决策变量得分初始化种群
            if REAL
                Dec = unifrnd(repmat(Problem.lower,Problem.N,1),repmat(Problem.upper,Problem.N,1));
            else
                Dec = ones(Problem.N,Problem.D);
            end
            Mask = zeros(Problem.N,Problem.D);
            for i = 1 : Problem.N
                Mask(i,TournamentSelection(2,ceil(rand*Problem.D),Fitness)) = 1;
            end
            Population = SOLUTION(Dec.*Mask);
            
            %%
            Zmin          = min(Population(all(Population.cons<=0,2)).objs,[],1);
%             [Population,Dec,Mask,FrontNo,CrowdDis] = EnvironmentalSelection([Population,TempPop],[Dec;TDec],[Mask;TMask],Problem.N);
            [Population,Dec,Mask] = EnvironmentalSelection([Population,TempPop],[Dec;TDec],[Mask;TMask],Problem.N,Z,Zmin);
            %% Optimization
            while Algorithm.NotTerminated(Population)
%                 MatingPool       = TournamentSelection(2,2*Problem.N,FrontNo,-CrowdDis);
                MatingPool = TournamentSelection(2,Problem.N,sum(max(0,Population.cons),2));
                
                [OffDec,OffMask] = Operator(Dec(MatingPool,:),Mask(MatingPool,:),Fitness,REAL);
                Offspring        = SOLUTION(OffDec.*OffMask);
                Zmin             = min([Zmin;Offspring(all(Offspring.cons<=0,2)).objs],[],1);
                
%                 [Population,Dec,Mask,FrontNo,CrowdDis] = EnvironmentalSelection([Population,Offspring],[Dec;OffDec],[Mask;OffMask],Problem.N);
                
                [Population,Dec,Mask] = EnvironmentalSelection([Population,Offspring],[Dec;OffDec],[Mask;OffMask],Problem.N,Z,Zmin);
                
                
                N          = min(Problem.N,length(Population));
                [FrontNo,~] = NDSort(Population.objs,Population.cons,N);
                score = max(FrontNo) - FrontNo + 1;
                MaskScore = Mask .* repmat(score, [Problem.D 1])';
                decScore = sum(MaskScore);
                Fitness = max(decScore) - decScore + 1;
            end
        end
    end
end