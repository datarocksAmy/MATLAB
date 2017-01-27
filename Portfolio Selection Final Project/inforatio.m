%Function Call-Calculate 3 Year and 5 Year Information Ratio

function [inforatio3yr inforatio5yr indexret3yr indexret5yr] = inforatio(return3yr, return5yr)

indexret3yr = 17.15;
indexret5yr = 14.14;
trackingerror3yr = std(return3yr-(indexret3yr/100));
trackingerror5yr = std(return5yr-(indexret5yr/100));

inforatio3yr = mean((return3yr-(indexret3yr/100))/trackingerror3yr);
inforatio5yr = mean((return5yr-(indexret5yr/100))/trackingerror5yr);