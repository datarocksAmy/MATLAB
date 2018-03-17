% ----------------------------------------------------------------------------------------------------
% Mode 2 :
% ---------------------------------------------------------------------------------------------------
clc
clear all
close all

% Set up testing and training data + Calculate Genuine Scores
[ first_img_vec, second_img_vec, img_vec ] = imgPrepModeTwo;

% PCA + Calculate Genuine Scores
[featureMatrixAgg, testProjectAgg, GenuineVec] = PCA_M2(first_img_vec, second_img_vec, img_vec );

 % Calculate Impostor Scores
 [ImpostorVec] = ImpostorCalc(featureMatrixAgg, testProjectAgg);
 
 % Genuine + Impostor
GI = [GenuineVec, ImpostorVec];

% Create Labels + Transform GI to 0-1
 [testLabels, GI_convert]=Label_TransformGI(GI);

% FPR, FNR + Plot Graph
ezroc3(GI, testLabels, 2, 0, 1);


