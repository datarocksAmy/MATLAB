% Convert Labels into One Hot Encoding Labels
function [ train_T, test_T ] = OneHotLabel(trainTarget, testTarget)

% Initialize Targets as zeros
train_T = zeros(40, length(trainTarget));
test_T = zeros(40, length(testTarget));

% Mark 1 with the corresponding index for train and test labels
for trainLoop = 1:length(trainTarget)
    train_T(trainTarget(trainLoop), trainLoop) = 1;
end

for testLoop = 1:length(testTarget)
    test_T(testTarget(testLoop), testLoop) = 1;
end

end