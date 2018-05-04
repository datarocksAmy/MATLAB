% ----------------------------------------------------------------------------------------------------
% PCA Mode 1 : 1-5 Images as Training and 6-10 Images as Testing
% ---------------------------------------------------------------------------------------------------

function[PCA_GI, PCA_Labels] = PCA_Main()

 % Calculate Genuine Scores
  [GenuineVec, featureMatrixAgg, testProjectAgg] = GenuineCalc_PCA();
 
 % Calculate Impostor Scores
 [ImpostorVec] = ImpostorCalc_PCA(featureMatrixAgg, testProjectAgg);
 
 % Genuine + Impostor
 PCA_GI = [GenuineVec, ImpostorVec];

% Create Labels + Transform GI to 0-1
 [PCA_Labels, GI_convert] = PCA_Label_TransformGI(PCA_GI);


end
