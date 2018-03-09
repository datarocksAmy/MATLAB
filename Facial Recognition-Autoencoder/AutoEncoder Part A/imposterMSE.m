 % Create pair images for input data
 % Calculate MSE and assign labels
 function[imposterMSE_Train,  imposterMSE_Test, IT_Train, IT_Test] = imposterMSE(trainIData, testIData)
 
 imposterMSE_Train = [];
 imposterMSE_Test = [];
 
 for idx = 1:length(trainIData)
    temp_mseImg = immse(trainIData{1, idx}{1, 1}, trainIData{1, idx}{1, 2});
    imposterMSE_Train = [imposterMSE_Train temp_mseImg];
 end
 
  for idx2 = 1:length(testIData)
    temp_mseImgT = immse(testIData{1, idx2}{1, 1}, testIData{1, idx2}{1, 2});
    imposterMSE_Test = [imposterMSE_Test temp_mseImgT];
  end
 

 % Label/Targets for Imposter
IT_Train = zeros(1, length(imposterMSE_Train));
IT_Test = zeros(1, length(imposterMSE_Test));
 end