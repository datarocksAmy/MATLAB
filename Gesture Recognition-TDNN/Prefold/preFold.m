% -------------------------------------------------------------------
% Mini Project #3 - Gesture Recognition : Time Delay Nerual Network
%  Pre-Fold
% -------------------------------------------------------------------

% Clear memory data
clc
clear 
close all

% Load in Person 2's x, z Data ( Including all 3 rounds )
[ P2_xz ] = EncapsulatePerson('GestureData\Person2.xls');

% 9 Combinations (depths + number of nodes)
% Do 5 Simulation for each combination & encapsulate to 1 net
% Save Net & plot ROC + Confusion Matrix
 depthsNodesDecision(P2_xz);