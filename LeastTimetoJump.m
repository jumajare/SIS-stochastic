function A=LeastTimetoJump(RateJumpVector)
global NumOfNodes
global endtime
%for i=1:length(RateOutVector)
%T(i)=ExponentialSample(RateOutVector)
%end
for i=1:NumOfNodes
    R(i)=Inf;
end
%R=double(NumOfNodes,1);
for i=1:NumOfNodes
    if isinf(RateJumpVector(i))==1
        R(i)=Inf;
    else
    R(i) = exprnd(RateJumpVector(i));
    end
end

[k,b]=min(R);
A=[k,b];
end
%b is the smallest value



%I is the position
