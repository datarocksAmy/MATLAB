% ----------------------------------------------------------------------------------------------------
% Facial Recognition : LDA
% ---------------------------------------------------------------------------------------------------

function[LDA_GI, LDA_Labels] = LDA_Main()

% Build LDA Model
[V, eigenVec, eigenVal, trainImg, testImg] = LDA_Model();

% Calculate Genuine and Impostor Scores
[LDA_GI] = GICalc_LDA(trainImg, testImg, V);

% Label
[LDA_Labels] = LDA_Label(size(LDA_GI, 1));
end