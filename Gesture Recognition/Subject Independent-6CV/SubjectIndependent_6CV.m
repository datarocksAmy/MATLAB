% -------------------------------------------------------------------
% Mini Project #3 - Gesture Recognition : Time Delay Nerual Network
% Subject Independent - 6 Fold CV
% -------------------------------------------------------------------

% Clear memory data
clc
clear 
close all

% Load 3 Rounds of x, z of each movement for each Person
[ P1_xz ] = EncapsulatePerson('GestureData\Person1.xls');
[ P2_xz ] = EncapsulatePerson('GestureData\Person2.xls');
[ P3_xz]  = EncapsulatePerson('GestureData\Person3.xls');
[ P4_xz ]  = EncapsulatePerson('GestureData\Person4.xls');
[ P5_xz ]  = EncapsulatePerson('GestureData\Person5.xls');
[ P6_xz ]  = EncapsulatePerson('GestureData\Person6.xls');


% 1-D Time Delay Nerual Network ( 1 Hidden Layer )
TDNNnet = timedelaynet(1:30, 1, 'trainbr');
TDNNnet.layers{2}.transferFcn = 'tansig';
TDNNnet.divideParam.trainRatio = 1;
TDNNnet.divideParam.valRatio = 0;
TDNNnet.divideParam.testRatio = 0;
TDNNnet.trainParam.epochs = 100;

% 6 Fold Cross Validation
[ trained6CVnet, predictTestT1, predictTestT2, predictTestT3, predictTestT4, predictTestT5, predictTestT6, stackMovementTest] ...
                                                                                                                                    = sixFoldCV(TDNNnet, P1_xz, P2_xz, P3_xz,P4_xz,P5_xz,P6_xz);