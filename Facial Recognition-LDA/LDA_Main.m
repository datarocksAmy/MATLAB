% ----------------------------------------------------------------------------------------------------
% Facial Recognition : LDA
% ---------------------------------------------------------------------------------------------------
clc
clear all
close all

% Label
[label] = label_GI();

% Build LDA Model
[V, eigenVec, eigenVal, trainImg, testImg] = LDAModel();

% Calculate Genuine and Impostor Scores
[GI] = Calc_Genuine_Impostor(trainImg, testImg, V);

% Plot ROC Curve
[roc,EER,area,EERthr,ALLthr] = ezroc3(GI, label, 2, 0, 1);

% GAR and FAR from ROC
GAR = roc(1, :)';

% Get FRR and FAR
FRR = round((GAR + 1)*10^4)/10^4;
FAR = round((roc(2, :)')*10^4)/10^4;

% Obtain FRR values at 0%, 5%, 10% FAR
case1 = [];
case2 = [];
case3 = [];

% Obtain EER for corresponding threshold
for idx = 1:size(FAR,1)
% FRR = 0%
    if (FAR(idx, 1)  == 0)
        case1 = [case1,FRR(idx, 1)];
% FAR = 5%
    elseif (0.005 <= FAR(idx, 1) && FAR(idx, 1) <=0.0055)
        case2 = [case2,FRR(idx, 1)];
% FAR = 10%
    elseif (0.1 <= FAR(idx, 1) && FAR(idx, 1) <=0.1015)
        case3 = [case3,FRR(idx, 1)];
    end
end
