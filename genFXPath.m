function [ FXPath ] = genFXPath( aInitVal, aZ, aLVVector, aTCutoff)
deltaT = 1/52 ; 
FXPath = ones(size(aZ, 1), size(aZ,2) + 1) * aInitVal ; 
for i = 2:size(FXPath, 2)
    loVol = localVol( i, aTCutoff, aLVVector );
    usrate = genUSIR( i*deltaT ) ; 
    eurate = genEUIR( i*deltaT ) ;
    lastFX = FXPath(:, i-1) ;
    FXPath(:, i) = lastFX + (usrate - eurate) .* lastFX .* deltaT + loVol .* lastFX .* sqrt(deltaT) .* aZ(:, i-1) ; 
end
end