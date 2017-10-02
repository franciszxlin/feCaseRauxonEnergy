function [ theLocalVol ] = localVol( aT, aTCutoff, aLVMatrix )
% LocalVol: a function to generate local volatility
%    Inputs:
%         - aT: (double) vector of time
%         - aTCutoff:   a vector of cutoff time
for i = 1:length(aTCutoff)
    if aT <= aTCutoff(i)
        LVVector = aLVMatrix(:, i) ; 
        break
    end
end
if aT > aTCutoff(end)
    LVVector = aLVMatrix(:, end) ; 
end 
theLocalVol = LVVector ;
end 