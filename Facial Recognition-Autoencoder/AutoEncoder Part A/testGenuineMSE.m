% Test MSE for Genuine
function [genuineMSE_Test, reshapeFeatureTest] = testGenuineMSE(predictTest)

% Initialize
reshapeFeatureTest = [];
genuineMSE_Test = [];

% Combo index list 
sort_TestCombo = combnk(1:4,2);

% Resize Feature 
 for num=1:length(predictTest)
     reshapeFeatureTest = [reshapeFeatureTest mean(predictTest(:, num))];
 end
 
 featureGTest = reshape(reshapeFeatureTest, 40, 4);
 
 % Set up Train MSE for Gunuine
 for faceNum = 1:length(featureGTest)
         for col = 1:length(sort_TestCombo)
             temp_test_pair = [mse(featureGTest(faceNum, sort_TestCombo(col, 1)), featureGTest(faceNum, sort_TestCombo(col, 2)))];
             genuineMSE_Test = [genuineMSE_Test temp_test_pair];
         end
 end
 