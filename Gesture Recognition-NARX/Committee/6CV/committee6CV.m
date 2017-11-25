% -------------------------------------------------------------------------------------------------------------
% Mini Project #4 - Gesture Recognition : NARX Nerual Network
% Subject Specific - 6 Fold CV Committee
% -------------------------------------------------------------------------------------------------------------

% Load 3 NARX net &  Run 6 CV on three different NARX nets for predicted values
load('InDelay15FeedDelay10Hidden15_CNet.mat');
[trained6CVnet1, predictTestT1n1, predictTestT2n1, predictTestT3n1, predictTestT4n1, predictTestT5n1, predictTestT6n1, stackMovementTest1] ...
                                                                                                                                                                                                    = main6CV(NARXnet);
load('InDelay30FeedDelay23Hidden15_CNet.mat');                                                                                                                                                                                                
[trained6CVnet2, predictTestT1n2, predictTestT2n2, predictTestT3n2, predictTestT4n2, predictTestT5n2, predictTestT6n2, stackMovementTest2] ...
                                                                                                                                                                                                      = main6CV(NARXnet);
load('InDelay30FeedDelay28Hidden15_CNet.mat');                                                                                                                                                                                                  
[trained6CVnet3, predictTestT1n3, predictTestT2n3, predictTestT3n3, predictTestT4n3, predictTestT5n3, predictTestT6n3, stackMovementTest3] ...
                                                                                                                                                                                                       = main6CV(NARXnet);
% Concat all three predictions
[predictTestT1] = concatAll6CV(predictTestT1n1, predictTestT1n2, predictTestT1n3);
[predictTestT2] = concatAll6CV(predictTestT2n1, predictTestT2n2, predictTestT2n3);
[predictTestT3] = concatAll6CV(predictTestT3n1, predictTestT3n2, predictTestT3n3);
[predictTestT4] = concatAll6CV(predictTestT4n1, predictTestT4n2, predictTestT4n3);
[predictTestT5] = concatAll6CV(predictTestT5n1, predictTestT5n2, predictTestT5n3);
[predictTestT6] = concatAll6CV(predictTestT6n1, predictTestT6n2, predictTestT6n3);

% ROC + Confusion Matrix
confusionROCcommittee6CV(predictTestT1, predictTestT2, predictTestT3, predictTestT4, predictTestT5, predictTestT6, stackMovementTest1);