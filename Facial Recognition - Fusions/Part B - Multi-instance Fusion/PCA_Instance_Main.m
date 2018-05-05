% ----------------------------------------------------------------------------------------------------
% PCA Model for Multi-Instance
% ---------------------------------------------------------------------------------------------------

function[PCA_GI_Instance, PCA_Labels_Instance] = PCA_Instance_Main()

% Train and test projected values
[featureMatrixAgg, testProjectAgg] = PCA_train_test();

% Calculate Genuine Scores & Impostor Scores for PCA Instance
[ PCA_GI_Instance ] = GICalc_Instance_PCA(featureMatrixAgg, testProjectAgg);

% PCA Instance Labels
% Initialize label matrix as 1
PCA_Labels_Instance = ones(size(PCA_GI_Instance,1), size(PCA_GI_Instance,1));

% Replace the label with 0 when it's the right class
for face = 1:40
        PCA_Labels_Instance(face, face) = 0;
end

end
