% -------------------------------------------------------------------------------------------------------------
% Mini Project #4 - Gesture Recognition : NARX Nerual Network
% Subject Specific - 3 Fold CV Committee
% -------------------------------------------------------------------------------------------------------------

% Load 3 NARX net & Run 3 CV on three different NARX nets for predicted values
load('InDelay15FeedDelay10Hidden15_CNet.mat');
[ predictTest_P1a, predictTest_P2a, predictTest_P3a, predictTest_P4a, predictTest_P5a, predictTest_P6a, stackMovementTest ] = ...
                                                                                                                                                                                                main3CV(NARXnet);
load('InDelay30FeedDelay23Hidden15_CNet.mat');
[ predictTest_P1b, predictTest_P2b, predictTest_P3b, predictTest_P4b, predictTest_P5b, predictTest_P6b, stackMovementTest_b ] = ...
                                                                                                                                                                                                main3CV(NARXnet);
load('InDelay30FeedDelay28Hidden15_CNet.mat');
[ predictTest_P1c, predictTest_P2c, predictTest_P3c, predictTest_P4c, predictTest_P5c, predictTest_P6c, stackMovementTest_c ] = ...
                                                                                                                                                                                                main3CV(NARXnet);     
                                                                                                                                                                                            
 % ROC + Confusion Matrix for each person                      
 confusionROCcommittee('Person1', predictTest_P1a, predictTest_P1b, predictTest_P1c, stackMovementTest);
 confusionROCcommittee('Person2', predictTest_P2a, predictTest_P2b, predictTest_P2c, stackMovementTest);
 confusionROCcommittee('Person3', predictTest_P3a, predictTest_P3b, predictTest_P3c, stackMovementTest);
 confusionROCcommittee('Person4', predictTest_P4a, predictTest_P4b, predictTest_P4c, stackMovementTest);
 confusionROCcommittee('Person5', predictTest_P5a, predictTest_P5b, predictTest_P5c, stackMovementTest);
 confusionROCcommittee('Person6',predictTest_P6a, predictTest_P6b, predictTest_P6c, stackMovementTest);
 