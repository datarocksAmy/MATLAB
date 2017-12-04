% Set up train (60%) and testing data (40%) for all 40 people
function [train_Shuffle_D, train_Shuffle_T, test_Shuffle_D, test_Shuffle_T] = setupData

% Initialize Cell Arrays to store all train and test Data
trainData ={};
testData = {};
trainTarget = [];
testTarget = [];

% Loop through all 40 people and prep for training and testing dataset
for faceNum = 1:40
    [ train_img_vec, train_Label, test_img_vec, test_Label ] = imageCategory(faceNum);
    % Set up Train + Test Image Data
    trainData = [trainData train_img_vec];
    testData = [testData test_img_vec];
    
    % Set Up Train + Test Image Label
    trainTarget = [trainTarget train_Label];
    testTarget = [testTarget test_Label];
end

% Shuffle index for train and test
trainShuffle_Idx = randperm(240,240);
testShuffle_Idx = randperm(160,160);

% Reorder data and label for training and testing
train_Shuffle_D = {};
test_Shuffle_D = {};
train_Shuffle_T = [];
test_Shuffle_T = [];

% Shuffled Train Data + Label
for trainShuf = 1:240
        train_Shuffle_D = [ train_Shuffle_D trainData(trainShuffle_Idx(trainShuf)) ];
        train_Shuffle_T = [ train_Shuffle_T trainTarget(trainShuffle_Idx(trainShuf)) ];
end

% Shuffle Test Data + Label
for testShuf = 1:160
       test_Shuffle_D = [ test_Shuffle_D testData(testShuffle_Idx(testShuf)) ];
       test_Shuffle_T = [ test_Shuffle_T testTarget(testShuffle_Idx(testShuf)) ];
end
end