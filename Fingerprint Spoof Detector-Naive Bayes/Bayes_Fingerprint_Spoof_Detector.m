% ------------------------------------------------------------------------------------------------
% Fingerprint Spoof Detector - Naive Bayes (Default Priors)
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
NBModel_LiveLatex = fitcnb(liveLatexTrain, liveLatexTrainLabel);

% >> Two classes =================================================
% Test model - Live + Latex
predictLabel_LiveLatex = predict(NBModel_LiveLatex, liveLatexTest);

% Resubstitution Classification Error - Live + Latex
LossLiveLatex = loss(NBModel_LiveLatex, liveLatexTest, liveLatexTestLabel);
resubErrorLiveLatex = resubLoss(NBModel_LiveLatex,'LossFun','classiferror');

% >> Three classes ================================================
% Test model - Live + Latex + Gelatine
predictLabel_LiveLatexGel = predict(NBModel_LiveLatex, liveLatexGelTest);

% Resubstitution Classification Error - Live + Latex + Gelatine
LossLiveLatexGel = loss(NBModel_LiveLatex, liveLatexGelTest, liveLatexGelTestLabel);
resubErrorLiveLatexGel = resubLoss(NBModel_LiveLatex,'LossFun','classiferror');