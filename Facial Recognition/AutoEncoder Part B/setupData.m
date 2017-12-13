% Set up train (60%) and testing data (40%) for all 40 people
function [trainData, trainTarget, testData, testTarget] = setupData

% Initialize Cell Arrays to store all train and test Data
trainData ={};
testData = {};
trainTarget = [];
testTarget = [];

% Loop through all 40 people and prep for training and testing dataset
for faceNum = 1:40
     [ train_img_vec, test_img_vec, train_Label, test_Label, train_GLabel, testG_Label ] = imageCategory(faceNum, 0, 0);
    
    % Set up Train + Test Image Data
    trainData = [trainData train_img_vec];
    testData = [testData test_img_vec];
    
    % Set Up Train + Test Image Label
    trainTarget = [trainTarget train_Label];
    testTarget = [testTarget test_Label];
end

end