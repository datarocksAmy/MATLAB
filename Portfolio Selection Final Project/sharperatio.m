%Function Call-Calculate 3 Year and 5 Year Sharpe Ratio

function [sharperatio3yr sharperatio5yr] = sharperatio(mean3yr, mean5yr, std3yr, std5yr)

rf = 0.031;
sharperatio3yr = (mean3yr-rf)/std3yr;
sharperatio5yr = (mean5yr-rf)/std5yr;