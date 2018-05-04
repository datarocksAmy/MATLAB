% ---------------------------------------------------------
% LDA Model for Multi-Instance
% ---------------------------------------------------------

function[LDA_GI_Instance, LDA_Labels_Instance] = LDA_Instance_Main()

% Build LDA Model
[V, eigenVec, eigenVal, trainImg, testImg] = LDAModel();

% Calculate Genuine and Impostor Scores
[LDA_GI_Instance] = GICalc_Instance_LDA(trainImg, testImg, V);

% Label
[LDA_Labels_Instance] = LDA_Instance_GILabel(size(LDA_GI_Instance, 1));


end