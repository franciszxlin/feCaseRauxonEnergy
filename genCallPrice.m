function [ theCallPrice ] = genCallPrice( FXPath, aStrike, aR, aT) 

    theCallPrice = exp(-aR * aT) * mean( max(FXPath(:, aT * 260 + 1) - aStrike, 0)) ; 
end 