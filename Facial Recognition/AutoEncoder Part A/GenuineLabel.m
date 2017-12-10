% Set up Genuine Labels for Train and Test
function [GT_Train, GT_Test] = GenuineLabel(genuineMSE_Train, genuineMSE_Test)

  % Label/Targets for Geuine
 GT_Train = ones(1, length(genuineMSE_Train));
 GT_Test = ones(1, length(genuineMSE_Test));

end