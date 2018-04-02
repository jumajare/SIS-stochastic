%%%%%%%%%


  load(['Simulation2000_FirstWave_3_' num2str(a1) '.mat'])


%% Susceptible, Infectious (S,I)

global NumOfStates
global NumOfNodes
global beta
global gamma
global NonContactTransitions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------ Initialize Parameters -----------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beta=2
gamma=1
NumOfStates=2
NonContactTransitions=zeros(NumOfNodes,NumOfStates)
t=0
C=zeros(NumOfStates,NumOfStates,NumOfStates)

C(1,2,2)=beta; % Transition Rate from state 1 to state 2 caused by neighbours
% in state 2


NonContactTransitions(2,1)=gamma % recovery of I-> Transition rate from state 2 to state 1
S=ones(NumOfNodes,1); %%%%%
S(5)=2;



%end
i=1;
array = nan(10,NumOfNodes+3);
I=ICounter(S,2)
while I>0
    K=NextEvent(A,S,C)
    S(K(3))=K(2);
    t=t+K(1)
    array(i,1)=t;
   % R=ICounter(S,2);
    I=ICounter(S,2);
    array(i,NumOfNodes+1)=I;
    array(i,1:NumOfNodes)=S;
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
