% Set up Combination train (60%) and testing data (40%) for all 40 people

function [trainIData, testIData] = setupImposterData(trainData, testData)

% Combo index list 
trainIdx = combnk(1:length(trainData),2);
testIdx = combnk(1:length(testData), 2);

% Find Index Numbers of comparing itself
deleteTrain = [];
deleteTest = [];

for num1 = 1:length(trainIdx)
    if trainIdx(num1, 2) < 6
        deleteTrain = [deleteTrain num1];
    end
end

for num2 = 1:length(testIdx)
    if testIdx(num2, 2) < 6
        deleteTest = [deleteTest num2];
    end
end

% Take out the rows if it's comparing with its own
for d = 1:length(deleteTrain)
    trainIdx(d, :) = [];
end
for d2 = 1:length(deleteTest)
    testIdx(d2, :) = [];
end

% Initialize Cell Arrays to store all train and test Data
trainIData ={};
testIData = {};


% Loop through all 40 people and prep for training and testing dataset
for trainLoop = 1:length(trainIdx)
        temp_train_pair = [{ cat(2, trainData(trainIdx(trainLoop, 1)), trainData(trainIdx(trainLoop, 2)))}];
        trainIData = [trainIData temp_train_pair];
        disp(trainLoop);
        temp_train_pair = [];
    
end
    
for testLoop = 1:length(testIdx)

        temp_test_pair = [{ cat(2, testData(testIdx(testLoop, 1)), testData(testIdx(testLoop, 2)))}];
        testIData = [testIData temp_test_pair];
        disp(testLoop);
        temp_test_pair = [];
end
end
