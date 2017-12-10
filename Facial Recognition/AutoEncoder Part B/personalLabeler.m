% Convert Labels into One Hot Encoding Labels based on Person

function [ train_person_T,  test_person_T ] = personalLabeler(trainTarget, testTarget, personNum)

% Initialize Targets as zeros
train_person_T = zeros(1, length(trainTarget));
test_person_T = zeros(1, length(testTarget));

% Mark 1 with the corresponding index for train and test labels
for trainLoop = 1:length(trainTarget)
    if trainTarget(trainLoop) == personNum
        train_person_T(1, trainLoop) = 1;
    end
end

for testLoop = 1:length(testTarget)
    if testTarget(testLoop) == personNum
        test_person_T(1, testLoop) = 1;
    end
end

end