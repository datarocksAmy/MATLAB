% --------------------------------------------------------------------------------------------
% Final Project - Facial Recognition : AutoEncoder
% Part B
% --------------------------------------------------------------------------------------------
clc
clear all

personTrainResult = [];
personTestResult = [];


% Load Images to set up all train and test data & targets
[trainData, trainTarget, testData, testTarget] = setupData;
[ train_T, test_T ] = OneHotLabel(trainTarget, testTarget);

% Train/Test Autocencoder for each person
for person = 1:40
    trainPT = train_T(person, :);
    testPT = test_T(person, :);
    %[person_train, person_test] = setupPersonData(trainData, testData, testTarget, trainTarget, person);
    [autoenc1, feature1, autoenc2, feature2, predictTest, predictTrain] = autoencoderModel(trainData, trainPT, testData);
    personTrainResult = [personTrainResult; predictTrain];
    personTestResult = [personTestResult; predictTest];

end




% Plot Test ROC
%ezroc3(personTestResult);
