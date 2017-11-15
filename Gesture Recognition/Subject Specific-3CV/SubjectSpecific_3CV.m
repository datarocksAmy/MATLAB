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

% 1-D Time Delay Nerual Network ( 1 Hidden Layer )
TDNNnet = timedelaynet(1:30, 1, 'trainbr');
TDNNnet.layers{2}.transferFcn = 'tansig';
TDNNnet.divideParam.trainRatio = 1;
TDNNnet.divideParam.valRatio = 0;
TDNNnet.divideParam.testRatio = 0;
TDNNnet.trainParam.epochs = 100;

% 3 Fold Cross Validation
[trained3CVnet_P1, predictTestT1_P1, predictTestT2_P1, predictTest_P1, stackMovementTest_P1] ...
                                                                                        = threeFoldCV(TDNNnet, P1_C, P1_T, P1_R, P1_D);
[trained3CVnet_P2, predictTestT1_P2, predictTestT2_P2, predictTest_P2, stackMovementTest_P2] ...
                                                                                        = threeFoldCV(TDNNnet, P2_C, P2_T, P2_R, P2_D);
[trained3CVnet_P3, predictTestT1_P3, predictTestT2_P3, predictTest_P3, stackMovementTest_P3] ...
                                                                                        = threeFoldCV(TDNNnet, P3_C, P3_T, P3_R, P3_D);
[trained3CVnet_P4, predictTestT1_P4, predictTestT2_P4, predictTest_P4, stackMovementTest_P4] ...
                                                                                        = threeFoldCV(TDNNnet, P4_C, P4_T, P4_R, P4_D);
[trained3CVnet_P5, predictTestT1_P5, predictTestT2_P5, predictTest_P5, stackMovementTest_P5] ...
                                                                                           = threeFoldCV(TDNNnet, P5_C, P5_T, P5_R, P5_D);
[trained3CVnet_P6, predictTestT1_P6, predictTestT2_P6, predictTest_P6, stackMovementTest_P6] ...
                                                                                            = threeFoldCV(TDNNnet, P6_C, P6_T, P6_R, P6_D);

% Save 3-CV Trained Net
save trained3CVnet_P1;
save trained3CVnet_P2;
save trained3CVnet_P3;
save trained3CVnet_P4;
save trained3CVnet_P5;
save trained3CVnet_P6;

% Plot ROC for CV1, CV2, CV3 and overall CV + save all graphs
confusionROC('Person1', predictTestT1_P1, predictTestT2_P1, predictTest_P1, stackMovementTest_P1);
confusionROC('Person2', predictTestT1_P2, predictTestT2_P2, predictTest_P2, stackMovementTest_P2);
confusionROC('Person3', predictTestT1_P3, predictTestT2_P3, predictTest_P3, stackMovementTest_P3);
confusionROC('Person4', predictTestT1_P4, predictTestT2_P4, predictTest_P4, stackMovementTest_P4);
confusionROC('Person5', predictTestT1_P5, predictTestT2_P5, predictTest_P5, stackMovementTest_P5);
confusionROC('Person6', predictTestT1_P6, predictTestT2_P6, predictTest_P6, stackMovementTest_P6);
