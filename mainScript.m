clear, clc; 
close all; 


% Clibrate optimal volatility matrix based on market implied Black Scholes
% ISD

FXZ = normrnd(0, 1, 1000, 156) ; 
FXInit = 1.2233 ;
strikeVec = [1.2233, 1.2233, 1.2233] ; 
Tvec = [0.25, 0.5, 1] ; 
implVolVec = [0.1135, 0.112, 0.111] ; 
initMatrix = [0.1135, 0.112, 0.111,0.15,0.16,0.17]; 
TCutoff = [ 13, 26, 39, 52, 104 ] ;
% Model calibration: trained the optimal matrix
trainedVolVector = fminsearch(@(x) optimizeVolMatrix(x, FXZ, FXInit,strikeVec,Tvec,implVolVec, TCutoff), initMatrix) ; 

trainedVolVector(5) = trainedVolVector(4) ;
trainedVolVector(6) = trainedVolVector(4) ;

% generate trained FX paths to use for risk management
trainedFXPath = genFXPath( FXInit, FXZ, trainedVolVector, TCutoff ) ; 
