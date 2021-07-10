%================================================
% MPSO: A Modified Particle Swarm Optimization Using Adaptive Strategy
% % Authors: Hao Liu, XueWei Zhang, LiangPing Tu
% Journal: Expert System With Applications
% Email: haoliu@ustl.edu.cn,    liuhustl@sina.cn
%================================================
% function [Gbest, gbestValue, FEs, Fbest]=MPSO(N,dim,FEs_Max,T_Max,fun,LB,UB)
function [bestSolution, bestFitness, iteration] = MPSO_FDB_case79(fhd, dimension, maxFEs, fnumber)
%% Settings variables 
settings;
N = 50; % Population size, number of particles
dim = dimension; % dimension size comes from cec2020
T_Max = maxFEs; % iteration size comes from cec2020
fun = fnumber; % function number comes from cec2020
settings;
LB = lbArray; % lower bound comes from cec2020
UB = ubArray; % upper bound comes from cec2020
Vmax0=0.5*(UB-LB); % maximum velocity
%% Inertial Weight
% w=0.72984;
w_max=0.9;
w_min=0.4;
Fbest=[];   x=rand;
%% Learning Factor
c1=2;%1.49618;
c2=c1;
%% Initialize Population
Xmax=repmat(UB,N,1);
Xmin=repmat(LB,N,1);
X=Xmin+(Xmax-Xmin).*rand(N,dim); % position
Vmax=repmat(Vmax0,N,1);
V=-Vmax+2*Vmax.*rand(N,dim); % velocity
%% Evaluation of particles.
fX(N)=inf;
for i=1:N
    % fX(i)=cec17_func(X(i,:)', fun);
    fX(i)=testFunction(X(i,:)', fhd, fun);
end
FEs=N;
%% Initialize Pbest and Gbest
Pbest=X; % personal best
fPbest=fX;
[gbestValue, gbestIndex]=min(fPbest); 
Gbest=Pbest(gbestIndex,:); % global best
Fbest=[Fbest gbestValue];   
%% Iteration
% for t=2:T_Max
t = 2;
while (t < T_Max) % fes <= maxFEs
    %% FDB integration
     fdb_index = fitnessDistanceBalance(X,fPbest);
    %% Update Position X and Velocity V and check the responding bounds
    x=4*x*(1-x);
    %% 1. Chaotic-Based Inertia Weight
    w=x*w_min+(w_max-w_min)*t/T_Max; 
    u=randperm(N,2);
    for i=1:N
        [UB,index]=min(fPbest(u));
        if min(fPbest(u))<fPbest(i)
            Ubest(i,:)=Pbest(index,:);
        else
            Ubest(i,:)=Pbest(i,:);
        end
    end
    %% 2. Stochastic and mainstream learning strategies
    V=w*V+c1*rand(N,dim).*(Ubest-X)+c2*rand(N,dim).*(repmat(mean(Pbest),N,1)-X);%(repmat(mean(Pbest),N,1)-X);
    V=max(-Vmax,min(Vmax,V));
    %% 3. Adaptive position updating strategy
    for i=1:N
        if exp(fX(i))/exp(mean(fX))>rand
            X(i,:)=w*X(i,:)+(1-w)*V(i,:)+Gbest;
        else
            X(i,:)=X(i,:)+V(i,:); 
        end
    end
    X=max(Xmin,min(Xmax,X));
    %% 4. Terminal Replacement Mechanism
    for i=1:N
        % fX(i)=cec17_func(X(i,:)', fun);
        fX(i)= testFunction(X(i,:)', fhd, fun); % equation (3)
        t=t+N;
    end
    [worst,index]=max(fX);
    z=[1:index-1,index+1:N]; 
    d=randperm(length(z),2);
    % case 79
    if rand < 0.5
        NewX=Gbest+rand*(Pbest(z(d(2)),:)-Pbest(z(d(fdb_index)),:));
    else
        NewX=Gbest+rand*(Pbest(z(d(2)),:)-Pbest(z(d(1)),:));
    end
    NewX=max(LB,min(UB,NewX));
    % fNewX=cec17_func(NewX',fun);
    fNewX=testFunction(NewX', fhd, fun);
    t=t+N;
    if fNewX<worst
        X(i,:)=NewX; % equation (4)
        fX(i)=fNewX; % equation (5)
    end
    %% ==Evaluate Fitness and Change Pbest
    for i=1:N
        if fX(i) < fPbest(i)
            Pbest(i,:)=X(i,:); % equation (6)
            fPbest(i)=fX(i); % equation (7)
        end
        if fPbest(i)<gbestValue
            Gbest=Pbest(i,:); % equation (8)
            gbestValue=fPbest(i); % equation (9)
        end
    end
    FEs = FEs + N;
    %% Record GbestValue so far for plotting
     if rem(t,4)==0
         Fbest=[Fbest gbestValue];
     end  
     t=t+1;
end % end iteration
%% Output variables
bestSolution = Gbest;
bestFitness = gbestValue;
iteration = t; 
end % end function    