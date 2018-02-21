% ------------------------------------------------------------------------------------------------
% Fingerprint Spoof Detector - Naive Bayes (Priors[0.6 0.4])
% ------------------------------------------------------------------------------------------------
clc
clear all

% Load in test & train data :
% Live fingerprints + Fake fingerprints for Gelatine & Latex
 [ liveTrain, liveTest, GelTrain, GelTest, LatexTrain, LatexTest] = loadData;

 % Concat live + Latex Train & Test 
liveLatexTrain = [liveTrain ; LatexTrain];
liveLatexTest = [liveTest ; LatexTest];
liveLatexTrainLabel = [ones(1000,1); zeros(200,1)];
liveLatexTestLabel = [ones(1000,1); zeros(200,1)];

% Concat live + Latex + Gelatine Test 
liveLatexGelTest = [liveLatexTest; GelTest];
liveLatexGelTestLabel = [ones(1000,1); zeros(400,1)];
 
% Train multiclass Naive Bayes Model - Live + Latex
NBModel_LiveLatex_P = fitcnb(liveLatexTrain, liveLatexTrainLabel);

%  Set Prior to [0.6 0.4]
NBModel_LiveLatex_P.Prior = [0.6 0.4];

% >> Two classes =================================================
% Test model - Live + Latex
predictLabel_LiveLatex_P = predict(NBModel_LiveLatex_P, liveLatexTest);

% Resubstitution Classification Error - Live + Latex
LossLiveLatex_P = loss(NBModel_LiveLatex_P, liveLatexTest, liveLatexTestLabel);
resubErrorLiveLatex_P = resubLoss(NBModel_LiveLatex_P,'LossFun','classiferror');

% >> Three classes ================================================
% Test model - Live + Latex + Gelatine
predictLabel_LiveLatexGel_P = predict(NBModel_LiveLatex_P, liveLatexGelTest);

% Resubstitution Classification Error - Live + Latex + Gelatine
LossLiveLatexGel_P = loss(NBModel_LiveLatex_P, liveLatexGelTest, liveLatexGelTestLabel);
resubErrorLiveLatexGel_P = resubLoss(NBModel_LiveLatex_P,'LossFun','classiferror');