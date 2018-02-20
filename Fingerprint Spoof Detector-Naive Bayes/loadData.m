function [ liveTrain, liveTest, GelTrain, GelTest, LatexTrain, LatexTest] = loadData

% Live fingerprints
loadliveTrain = load('featureMat_liv_train_bioLBP.mat');
loadliveTest = load('featureMat_liv_test_bioLBP.mat');
liveTrain = loadliveTrain.featureMat_liv_train_bioLBP;
liveTest = loadliveTest.featureMat_liv_test_bioLBP;

% Fake fingerprints - Gelatine
loadGelTrain = load('featureMat_Gelatine_train_bioLBP.mat');
loadGelTest = load('featureMat_Gelatine_test_bioLBP.mat');
GelTrain = loadGelTrain.featureMat_Gelatine_train_bioLBP;
GelTest =  loadGelTest.featureMat_Gelatine_test_bioLBP;

% Fake fingerprints - Latex
loadLatTrain = load('featureMat_Latex_train_bioLBP.mat');
loadLatTest = load('featureMat_Latex_test_bioLBP.mat');
LatexTrain = loadLatTrain.featureMat_Latex_train_bioLBP;
LatexTest = loadLatTest.featureMat_Latex_test_bioLBP;


end