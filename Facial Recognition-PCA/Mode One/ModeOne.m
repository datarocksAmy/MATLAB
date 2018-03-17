% ----------------------------------------------------------------------------------------------------
% Mode 1 : 1-5 Images as Training and 6-10 Images as Testing
% ---------------------------------------------------------------------------------------------------
clc
clear all
close all

 % Calculate Genuine Scores
  [GenuineVec, featureMatrixAgg, testProjectAgg] = GenuineCalc;
 
 % Calculate Impostor Scores
 [ImpostorVec] = ImpostorCalc(featureMatrixAgg, testProjectAgg);
 
 % Genuine + Impostor
  GI = [GenuineVec, ImpostorVec];

% Create Labels + Transform GI to 0-1
 [testLabels, GI_convert]=Label_TransformGI(GI);

 % FPR, FNR + Plot Graph
ezroc3(GI, testLabels, 2, 0, 1);


