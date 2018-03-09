% Train MSE for Genuine - Person
function [genuineMSE_Train, reshapeFeatureTrain] = trainGenuineMSE(feature)

% Initialize 
reshapeFeatureTrain = [];
genuineMSE_Train = [];

% Resize Feature 
 for num=1:length(feature)
     reshapeFeatureTrain = [reshapeFeatureTrain mean(feature(:, num))];
 end
 
 featureG = reshape(reshapeFeatureTrain, 40, 6);
 
 % Set up Train MSE for Gunuine
 for faceNum = 1:length(featureG)
         for col = 1:length(sort_TrainCombo)
             temp_train_pair = [mse(featureG(faceNum, sort_TrainCombo(col, 1)), featureG(faceNum, sort_TrainCombo(col, 2)))];
             genuineMSE_Train = [genuineMSE_Train temp_train_pair];
         end
 end
 