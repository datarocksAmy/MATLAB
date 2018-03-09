% Set up Labels for Imposter Train and Test

function [IT_Train, IT_Test] = ImposterLabel(imposterMSE_Train, imposterMSE_Test)
 
  % Label/Targets for Imposter
IT_Train = zeros(1, length(imposterMSE_Train));
IT_Test = zeros(1, length(imposterMSE_Test));
end
