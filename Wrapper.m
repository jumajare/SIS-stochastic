%Second Wave Script

function a =Wrapper(a1,sig)

  load(['Simulation2000_FirstWave_3_' num2str(a1) '.mat']) 
  
  global NumOfStates
NumOfStates=3
global NumOfNodes


global beta
global gamma

global NonContactTransitions
beta=2
gamma=1
global sigma
sigma=sig;
NonContactTransitions=zeros(NumOfNodes,NumOfStates)
t=0
C=zeros(NumOfStates,NumOfStates,NumOfStates)
C(1,2,2)=beta;
%C(3,2,2)=beta*sigma   % 3 is A               %transmission

NonContactTransitions(2,3)=gamma %recovery of I

%J=randi([1,2000],3,1)
%for i1=1:length(J)
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