% ----------------------------------------------------------------------------------------------------
% PCA Mode 1 : 1-5 Images as Training and 6-10 Images as Testing  -
% Modified for Multi-Instance
% ---------------------------------------------------------------------------------------------------

function[PCA_GI, PCA_Labels] = PCA_Main()

 % Train and test projected values
[featureMatrixAgg, testProjectAgg] = PCA_train_test();

% Bag projected values
[testBag, trainBag] = bag_features(featureMatrixAgg, testProjectAgg);

% Calculate Genuine Scores


 % Calculate Impostor Scores
 [ImpostorVec] = ImpostorCalc(featureMatrixAgg, testProjectAgg);
 
 % Genuine + Impostor
 PCA_GI = [GenuineVec, ImpostorVec];

% Create Labels + Transform GI to 0-1
 [PCA_Labels, GI_convert] = Label_TransformGI(PCA_GI);


end
