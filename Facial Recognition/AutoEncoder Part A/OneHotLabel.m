% Convert Labels into One Hot Encoding Labels

[train_Shuffle_D, train_Shuffle_T, test_Shuffle_D, test_Shuffle_T] = setupData;

% Initialize Targets as zeros
train_T = zeros(40, 240);
test_T = zeros(40, 160);

% Mark 1 with the corresponding index for train and test labels
for trainLoop = 1:length(train_Shuffle_T)
    train_T(train_Shuffle_T(trainLoop), trainLoop) = 1;
end

for testLoop = 1:length(test_Shuffle_T)
    test_T(test_Shuffle_T(testLoop), testLoop) = 1;
end