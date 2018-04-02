%%%%%%%%%


  load(['Simulation2000_FirstWave_3_' num2str(a1) '.mat'])


%% Susceptible, Infectious (S,I)

global NumOfStates
global NumOfNodes
global beta
global gamma
global NonContactTransitions
global sigma

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------ Initialize Parameters -----------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beta=2
gamma=1
sigma=sig;
NumOfStates=2
NonContactTransitions=zeros(NumOfNodes,NumOfStates)
t=0
C=zeros(NumOfStates,NumOfStates,NumOfStates)
% Transition Rate from state 1 to state 2 caused by neighbours
% in state 2
C(1,2,2)=beta;
%Transition from state 2 to state 1
NonContactTransitions(2,1)=gamma % recovery of I
S=ones(NumOfNodes) %%%%%
S(5)=2



%end
i=1;
array = nan(2000,NumOfNodes+3);
I=2
while I>0
    K=NextEvent(A,S,C)
    S(K(3))=K(2);
    t=t+K(1)
    array(i,1)=t;
    R=ICounter(S,3);
    I=ICounter(S,2);
    array(i,1)=I;
    array(i,2:NumOfNodes)=S;
    i=i+1;
    ICounter(S,2);
end

R=ICounter(S,4)
save(['/juanj/Desktop/ForPresentation' num2str(a1) '.mat'])
end
%save(['SimulationSecondWaveEuler_0232_' num2str(j) '.mat'])
%save(['SimulationSecondWaveEuler_0225' num2str(j) '.mat'])
%save(['SimulationSecondWaveEuler_2SlightlyAbove' num2str(j) '.mat'])
%save(['SimulationSecondWaveEuler_2Below' num2str(j) '.mat'])
%load(['SimulationSecondWaveEuler_2Above' num2str(l) '.mat'])
