% Train MSE for Imposter
function [imposterMSE_Test] = testImposterMSE(reshapeFeatureTest)

% Combo index list 
testIdx = combnk(1:length(reshapeFeatureTest), 2);

% Find Index Numbers of comparing itself
deleteTest = [];

for num = 1:length(testIdx)
    if testIdx (num, 2) < 6
        deleteTest = [deleteTest num];
    end
end

% Take out the rows if it's comparing with its own
for d = 1:length(deleteTest)
    testIdx(d, :) = [];
end

% Initialize Cell Arrays to store all train Data
imposterMSE_Test =[];

% Loop through all 40 people and prep for training
for testLoop = 1:length(testIdx)
        temp_test_pair = [mse(reshapeFeatureTest(1, testIdx(testLoop, 1)), reshapeFeatureTest(1, testIdx(testLoop, 2)))];
        imposterMSE_Test = [imposterMSE_Test temp_test_pair];
        disp(testLoop);
        temp_test_pair = [];
    
end

end