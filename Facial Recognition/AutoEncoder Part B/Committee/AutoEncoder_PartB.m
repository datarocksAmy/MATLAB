% --------------------------------------------------------------------------------------------
% Final Project - Facial Recognition : AutoEncoder
% Part B - Train Autoencoder by person 
% --------------------------------------------------------------------------------------------
clc
clear all

% Initialize empty vector to store train and test result from all 40 people
% And two zero 3D vectors to store committee train and test results
personTrainResult = [];
personTestResult = [];
personTrain = zeros(40, 240, 3);
personTest = zeros(40, 160, 3);

% Load Images to set up all train and test data & targets
[ trainData, trainTarget, testData, testTarget ] = setupData;
[ train_T, test_T ] = OneHotLabel(trainTarget, testTarget);

% Train/Test Autocencoder for each person
for combo = 1:3
    for person = 1:40
        % Train and Test Targets
        trainPT = train_T(person, :);
        testPT = test_T(person, :);

        % AutoEncoder Model
        [autoenc1, feature1, autoenc2, feature2, predictTest, predictTrain] = ...
        autoencoderModel(trainData, trainPT, testData, combo);

        % Store the train and test results from each person
        personTrainResult = [personTrainResult; predictTrain];
        personTestResult = [personTestResult; predictTest];
        fprintf(strcat('>>>>>>>>>>>>>>>>> Person ' ,int2str(person), '\n'))

    end
    % Store train and test for different parameters in autoencoder
    personTrain(:, :, combo) = personTrainResult;
    personTest(:, :, combo) = personTestResult;
end

% Take an average on train and test results for committee
personTrainCommittee = (personTrain(:, :, 1)+personTrain(:, :, 2)+personTrain(:, :, 3))/3;
personTestCommittee = (personTest(:, :, 1)+personTest(:, :, 2)+personTest(:, :, 3))/3;


% Plot Train + Test ROC for the best optimized net
ezroc3(personTrain(:, :, 1), train_T);
saveas(figure(2), [pwd '\Graphs\TrainROC3.fig']);
ezroc3(personTest(:, :, 1), test_T);
saveas(figure(3), [pwd '\Graphs\TestROC3.fig']);

% Plot Train + Test ROC for the committee
ezroc3(personTrainCommittee, train_T);
saveas(figure(4), [pwd '\Graphs\TrainROC_Committee.fig']);
ezroc3(personTestCommittee, test_T);
saveas(figure(5), [pwd '\Graphs\TestROC_Committee.fig']);