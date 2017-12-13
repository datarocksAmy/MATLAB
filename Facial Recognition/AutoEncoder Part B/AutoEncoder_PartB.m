% --------------------------------------------------------------------------------------------
% Final Project - Facial Recognition : AutoEncoder
% Part B - Train Autoencoder by person 
% --------------------------------------------------------------------------------------------
clc
clear all

% Initialize empty vector to store train and test result from all 40 people
personTrainResult = [];
personTestResult = [];


% Load Images to set up all train and test data & targets
[ trainData, trainTarget, testData, testTarget ] = setupData;
[ train_T, test_T ] = OneHotLabel(trainTarget, testTarget);

% Train/Test Autocencoder for each person
for person = 1:40
    % Train and Test Targets
    trainPT = train_T(person, :);
    testPT = test_T(person, :);
    
    % AutoEncoder Model
    [autoenc1, feature1, autoenc2, feature2, predictTest, predictTrain] = autoencoderModel(trainData, trainPT, testData);
    
    % Store the train and test results from each person
    personTrainResult = [personTrainResult; predictTrain];
    personTestResult = [personTestResult; predictTest];

end

% Plot Train + Test ROC
ezroc3(personTrainResult, train_T);
saveas(figure(2), [pwd '\Graphs\TrainROC.fig']);
ezroc3(personTestResult, test_T);
saveas(figure(3), [pwd '\Graphs\TestROC.fig']);

