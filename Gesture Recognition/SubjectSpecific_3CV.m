% -------------------------------------------------------------------
% Mini Project #3 - Gesture Recognition : Time Delay Nerual Network
% Subject Specific - 3 Fold CV
% -------------------------------------------------------------------

% Clear memory data
clc
clear 
close all

% Load 3 Rounds of x, z of each movement for each Person
[ P1_C, P1_T, P1_R, P1_D ] = Encapsulate('GestureData\Person1.xls');
[ P2_C, P2_T, P2_R, P2_D ] = Encapsulate('GestureData\Person2.xls');
[ P3_C, P3_T, P3_R, P3_D ]  = Encapsulate('GestureData\Person3.xls');
[ P4_C, P4_T, P4_R, P4_D ]  = Encapsulate('GestureData\Person4.xls');
[ P5_C, P5_T, P5_R, P5_D ]  = Encapsulate('GestureData\Person5.xls');
[ P6_C, P6_T, P6_R, P6_D ]  = Encapsulate('GestureData\Person6.xls');