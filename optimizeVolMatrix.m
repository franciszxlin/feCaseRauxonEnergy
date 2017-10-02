function [ loss ] = optimizeVolMatrix( aVol, aZ, aInitVal, aR, aStrikePriceVec, aTVec, aImplVolTargetVec, aTCutoff)
% OPTIMIZEVOL function
FXPath = genFXPath( aInitVal, aZ, aVol, aTCutoff, aR) ; 
implVolVec=zeros(size(aSrikePriceVec)) ; 

for i=1:length(implVolVec)
    tempCall = genCallPrice( FXPath, aStrikePriceVec(i), aR, aTVec(i)) ; 
    implVolVec(i) = blsimpv( aInitVal, aStrikePriceVec(i), aR, aTVec(i), tempCall) ; 
end

loss = sum( (implVolVec - aImplVolTargetVec).^2 ); 
end