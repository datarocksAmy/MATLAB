% -------------------------------------------------------------------
% Mini Project #3 - Gesture Recognition : Time Delay Nerual Network
% Subject Specific - 3 Fold CV
% -------------------------------------------------------------------

% Clear memory data
%clc
%clear 
%close all

% Load 3 Rounds of x, z of each movement for each Person
[ P_C, P_T, P_R, P_D ] = Encapsulate('GestureData\Person1.xls');
%[ P2_C, P2_T, P2_R, P2_D ] = Encapsulate('GestureData\Person2.xls');
%[ P3_C, P3_T, P3_R, P3_D ]  = Encapsulate('GestureData\Person3.xls');
%[ P4_C, P4_T, P4_R, P4_D ]  = Encapsulate('GestureData\Person4.xls');
%[ P5_C, P5_T, P5_R, P5_D ]  = Encapsulate('GestureData\Person5.xls');
%[ P6_C, P6_T, P6_R, P6_D ]  = Encapsulate('GestureData\Person6.xls');

% 1-D Time Delay Nerual Network ( 1 Hidden Layer )
TDNNnet = timedelaynet(0:15, 1, 'trainbr');
TDNNnet.divideFcn = '';
TDNN.layer{2}.transferFcn = 'transig';
TDNN.divideParam.transRatio = 1;
TDNN.divideParam.valRatio = 0;
TDNN.divideParam.testRatio = ;

