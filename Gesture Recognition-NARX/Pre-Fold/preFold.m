% ---------------------------------------------------------------------------------------
% Mini Project #4 - Gesture Recognition : NARX Net
%  Pre-Fold
% ---------------------------------------------------------------------------------------

% Clear memory data
clc
clear 
close all

% Load in Person 2's x, z Data ( Including all 3 rounds )
[ P2_xz ] = EncapsulatePerson('GestureData\Person2.xls');

% 2 kinds of Input Delay Lines x 2 kinds of Hidden Layer Size x 3 kinds of Output Delay Lines
% Output Delay has to be smaller than Input Delay
% Do 5 Simulation for each combination & encapsulate to 1 net
% Save Net & plot ROC + Confusion Matrix
 inputHiddenOutputDelay(P2_xz);