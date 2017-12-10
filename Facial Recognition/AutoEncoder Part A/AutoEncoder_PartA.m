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

% Calculate MSE for Geuine and Imposter
% Train - feature 1 & feature 2
[genuineMSE_Train, reshapeFeatureTrain] = trainGenuineMSE(feature1);
[imposterMSE_Train] = trainImposterMSE(reshapeFeatureTrain);

[genuineMSE_Train2, reshapeFeatureTrain2] = trainGenuineMSE(feature2);
[imposterMSE_Train2] = trainImposterMSE(reshapeFeatureTrain2);

% Test
[ genuineMSE_Test, reshapeFeatureTest] = testGenuineMSE(predictTest);
[ imposterMSE_Test] = testImposterMSE(reshapeFeatureTest);
% Deep Net Test
[ genuineMSE_Test_DN, reshapeFeatureTest_DN] = testGenuineMSE(predictTest_DN);
[ imposterMSE_Test_DN] = testImposterMSE(reshapeFeatureTest_DN);

% Geuine + Imposter Data for Train and Test
genuine_Imposter_Train = [genuineMSE_Train imposterMSE_Train];
genuine_Imposter_Test = [genuineMSE_Test imposterMSE_Test];
genuine_Imposter_Train2 = [genuineMSE_Train2 imposterMSE_Train2];
genuine_Imposter_Test_DN = [genuineMSE_Test_DN imposterMSE_Test_DN];

% Geuine + Imposter Labels for Train and Test
[GT_Train, GT_Test] = GenuineLabel(genuineMSE_Train, genuineMSE_Test);
[IT_Train, IT_Test] = ImposterLabel(imposterMSE_Train, imposterMSE_Test);

GI_Train = [ GT_Train IT_Train];
GI_Test = [ GT_Test IT_Test];

ezroc3(predictTest, test_T);
saveas(figure(2), [pwd '\Graphs\5\predictROC.fig']);
ezroc3(predictTest_DN, test_T);
saveas(figure(3), [pwd '\Graphs\5\predictDNROC.fig']);

% ROC from Train and Test Geuine + Imposter Scores
ezroc3(-genuine_Imposter_Train, GI_Train);
saveas(figure(4), [pwd '\Graphs\5\GeuineImposter_TrainROC.fig']);

ezroc3(-genuine_Imposter_Test, GI_Test);
saveas(figure(5), [pwd '\Graphs\5\GeuineImposter_TestROC.fig']);

ezroc3(-genuine_Imposter_Train2, GI_Train);
saveas(figure(6), [pwd '\Graphs\5\GeuineImposter_Train2ROC.fig']);

ezroc3(-genuine_Imposter_Test_DN, GI_Test);
saveas(figure(7), [pwd '\Graphs\5\GeuineImposter_Test_DNROC.fig']);