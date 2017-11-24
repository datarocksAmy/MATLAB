% -------------------------------------------------------------------
% Mini Project #4 - Gesture Recognition : NARX Nerual Network
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

% Load Time Delay Nerual Network
load('InDelay30FeedDelay28Hidden15_CNet.mat');

% 3 Fold Cross Validation
[trained3CVnet_P1, predictTestT1_P1, predictTestT2_P1, predictTest_P1, stackMovementTest_P1] ...
                                                                                        = threeFoldCV(NARXnet, P1_C, P1_T, P1_R, P1_D);
[trained3CVnet_P2, predictTestT1_P2, predictTestT2_P2, predictTest_P2, stackMovementTest_P2] ...
                                                                                        = threeFoldCV(NARXnet, P2_C, P2_T, P2_R, P2_D);
[trained3CVnet_P3, predictTestT1_P3, predictTestT2_P3, predictTest_P3, stackMovementTest_P3] ...
                                                                                        = threeFoldCV(NARXnet, P3_C, P3_T, P3_R, P3_D);
[trained3CVnet_P4, predictTestT1_P4, predictTestT2_P4, predictTest_P4, stackMovementTest_P4] ...
                                                                                        = threeFoldCV(NARXnet, P4_C, P4_T, P4_R, P4_D);
[trained3CVnet_P5, predictTestT1_P5, predictTestT2_P5, predictTest_P5, stackMovementTest_P5] ...
                                                                                           = threeFoldCV(NARXnet, P5_C, P5_T, P5_R, P5_D);
[trained3CVnet_P6, predictTestT1_P6, predictTestT2_P6, predictTest_P6, stackMovementTest_P6] ...
                                                                                            = threeFoldCV(NARXnet, P6_C, P6_T, P6_R, P6_D);


% Plot ROC for CV1, CV2, CV3 and overall CV + save all graphs
confusionROC('Person1', predictTestT1_P1, predictTestT2_P1, predictTest_P1, stackMovementTest_P1);
confusionROC('Person2', predictTestT1_P2, predictTestT2_P2, predictTest_P2, stackMovementTest_P2);
confusionROC('Person3', predictTestT1_P3, predictTestT2_P3, predictTest_P3, stackMovementTest_P3);
confusionROC('Person4', predictTestT1_P4, predictTestT2_P4, predictTest_P4, stackMovementTest_P4);
confusionROC('Person5', predictTestT1_P5, predictTestT2_P5, predictTest_P5, stackMovementTest_P5);
confusionROC('Person6', predictTestT1_P6, predictTestT2_P6, predictTest_P6, stackMovementTest_P6);
