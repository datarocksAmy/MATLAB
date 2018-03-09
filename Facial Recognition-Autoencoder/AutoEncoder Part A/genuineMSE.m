 % Create pair images for input data
 % Calculate MSE and assign labels
 function[geuineMSE_Train,  geuineMSE_Test, GT_Train, GT_Test] = genuineMSE(trainData, testData)
 
 geuineMSE_Train = [];
 geuineMSE_Test = [];
 
 for idx = 1:length(trainData)
    temp_mseImg = immse(trainData{1, idx}{1, 1}, trainData{1, idx}{1, 2});
    geuineMSE_Train = [geuineMSE_Train temp_mseImg];
 end
 
  for idx2 = 1:length(testData)
    temp_mseImgT = immse(testData{1, idx2}{1, 1}, testData{1, idx2}{1, 2});
    geuineMSE_Test = [geuineMSE_Test temp_mseImgT];
  end
  
  % Label/Targets for Geuine
 GT_Train = ones(1, length(geuineMSE_Train));
 GT_Test = ones(1, length(geuineMSE_Test));
 end

 