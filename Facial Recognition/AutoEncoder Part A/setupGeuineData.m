% Set up Combination train (60%) and testing data (40%) for all 40 people

function [trainGData, testGData, trainGTarget, testGTarget, sort_TrainCombo, sort_TestCombo] = setupGeuineData

% Combo index list 
sort_TrainCombo = combnk(1:6,2);
sort_TestCombo = combnk(1:4,2);


% Initialize Cell Arrays to store all train and test Data
trainGData ={};
testGData = {};
trainGTarget = [];
testGTarget = [];

% Loop through all 40 people and prep for training and testing dataset
for faceNum = 1:40
    [ train_img_vec, test_img_vec, train_Label, test_Label,train_GLabel, test_GLabel ] = imageCategory(faceNum, sort_TrainCombo, sort_TestCombo);
    
    for row = 1:length(sort_TrainCombo)
    % Set up Train + Test Image Data for Gunuine
        temp_train_pair = [{ cat(2, train_img_vec(sort_TrainCombo(row, 1)), train_img_vec(sort_TrainCombo(row, 2))) }];
        trainGData = [trainGData temp_train_pair];
        
        if row <= length(sort_TestCombo)
        temp_test_pair = [{cat(2, test_img_vec(sort_TestCombo(row, 1)), test_img_vec(sort_TestCombo(row, 2))) }];
        testGData = [testGData temp_test_pair];
        end    
        
        temp_train_pair = [];
        temp_test_pair = [];
    end
     % Set Up Train + Test Image Label
    trainGTarget = [trainGTarget train_GLabel];
    testGTarget = [testGTarget test_GLabel];
end

end