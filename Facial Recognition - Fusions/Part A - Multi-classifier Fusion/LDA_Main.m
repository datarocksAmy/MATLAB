% ----------------------------------------------------------------------------------------------------
% Facial Recognition : LDA
% ---------------------------------------------------------------------------------------------------

function[LDA_GI, LDA_Labels] = LDA_Main()

% Label
[LDA_Labels] = label_GI();

% Build LDA Model
[V, eigenVec, eigenVal, trainImg, testImg] = LDAModel();

% Calculate Genuine and Impostor Scores
[LDA_GI] = Calc_Genuine_Impostor(trainImg, testImg, V);

end