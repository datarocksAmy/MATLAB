% --------------------------------------------------------------------------------------------
% Final Project - Facial Recognition : AutoEncoder
% Part A
% --------------------------------------------------------------------------------------------
clc
clear all
% Load Images to set up train and test data & targets
[trainData, trainTarget, testData, testTarget] = setupData;
[ train_T, test_T ] = OneHotLabel(trainTarget, testTarget);

% Train + Test AutoEncoder
[autoenc1, feature1, autoenc2, feature2, predictTest, predictTest_DN ] = autoEncoderModel(trainData, train_T, testData, test_T);

% Set up data for Geuine and Imposter
[trainGData, testGData, trainGTarget, testGTarget, sort_TrainCombo, sort_TestCombo] = setupGeuineData;
[trainIData, testIData] = setupImposterData(trainData, testData);
 
% Calculate MSE for Geuine and Imposter
[geuineMSE_Train,  geuineMSE_Test, GT_Train, GT_Test] = genuineMSE(trainGData, testGData);
[imposterMSE_Train,  imposterMSE_Test, IT_Train, IT_Test] = imposterMSE(trainIData, testIData);

% Geuine + Imposter Data for Train and Test
geuine_Imposter_Train = [geuineMSE_Train imposterMSE_Train];
geuine_Imposter_Test = [geuineMSE_Test imposterMSE_Test];

% Geuine + Imposter Labels for Train and Test
GI_Train = [ GT_Train IT_Train];
GI_Test = [ GT_Test IT_Test];

% ROC from AutoEncoder 
figure(1)
ezroc3(predictTest, test_T);
figure(2)
ezroc3(predictTest_DN, test_T);

% ROC from Train and Test Geuine + Imposter Scores
figure(3)
ezroc3(geuine_Imposter_Train, GI_Train);
figure(4)
ezroc3(geuine_Imposter_Test, GI_Test);