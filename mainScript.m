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

% First we need to extrapolate implied volatiltiy for the year 1 - 3
% we will use the local volatility model for 0, 0.25, 0.5, 0.75, 1, 2, 3 points

T = [ 0.25, 0.5, 1 ] ; 
v = [ 0.1135, 0.112, 0.111 ] ; 
extraVol = cspline(T, v) ; 
