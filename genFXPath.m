function [ FXPath ] = genFXPath( aInitVal, aZ, aLVMatrix, aTCutoff, aR)

deltaT = 1/260 ; 
FXPath = ones(size(aZ, 1), size(aZ,2), + 1) * aInitVal ; 
for i = 2:size(FXPath, 2)
    volVector = localVol( i, aTCutoff, aLVMatrix ); 
    FXPath(:, i) = FXPath(:, i-1) .* exp( (aR - 0.5 * volVector.^2) * deltaT + sqrt(deltaT) * volVector .* aZ(:, i-1)); 
end
end