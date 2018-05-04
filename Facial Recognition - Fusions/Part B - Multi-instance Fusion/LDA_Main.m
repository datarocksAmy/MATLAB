% ----------------------------------------------------------------------------------------------------
% Facial Recognition : LDA
% ---------------------------------------------------------------------------------------------------

function[LDA_GI, LDA_Labels] = LDA_Main()

% Build LDA Model
[V, eigenVec, eigenVal, trainImg, testImg] = LDAModel();

% Calculate Genuine and Impostor Scores
[LDA_GI] = Calc_Genuine_Impostor(trainImg, testImg, V);

% Label
[LDA_Labels] = label_GI(size(LDA_GI, 1));
end