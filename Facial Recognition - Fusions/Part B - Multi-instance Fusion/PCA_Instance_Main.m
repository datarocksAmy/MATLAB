% ----------------------------------------------------------------------------------------------------
% PCA Model for Multi-Instance
% ---------------------------------------------------------------------------------------------------

function[PCA_GI_Instance, PCA_Labels_Instance] = PCA_Instance_Main()

% Train and test projected values
[featureMatrixAgg, testProjectAgg] = PCA_train_test();


% Calculate Genuine Scores & Impostor Scores for PCA Instance
[ GenuineVec, ImpostorVec ] = GICalc_Instance_PCA(featureMatrixAgg, testProjectAgg);
PCA_GI_Instance= [GenuineVec, ImpostorVec]';

% PCA Instance Labels
g = ones(1, size(GenuineVec, 2));
i = zeros(1, size(ImpostorVec,2));
PCA_Labels_Instance = [g, i];


end
