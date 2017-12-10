% Train MSE for Imposter
function [imposterMSE_Train] = trainImposterMSE(reshapeFeatureTrain)

% Combo index list 
trainIdx = combnk(1:length(reshapeFeatureTrain),2);

% Find Index Numbers of comparing itself
deleteTrain = [];
%deleteTest = [];

for num1 = 1:length(trainIdx)
    if trainIdx(num1, 2) < 6
        deleteTrain = [deleteTrain num1];
    end
end

% Take out the rows if it's comparing with its own
for d = 1:length(deleteTrain)
    trainIdx(d, :) = [];
end

% Initialize Cell Arrays to store all train Data
imposterMSE_Train =[];

% Loop through all 40 people and prep for training
for trainLoop = 1:length(trainIdx)
        temp_train_pair = [mse(reshapeFeatureTrain(1, trainIdx(trainLoop, 1)), reshapeFeatureTrain(1, trainIdx(trainLoop, 2)))];
        imposterMSE_Train = [imposterMSE_Train temp_train_pair];
        disp(trainLoop);
        temp_train_pair = [];
    
end

end