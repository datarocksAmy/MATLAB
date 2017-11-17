% Train 5 times for the Initial Net
function[ ResultMatrix ] = fiveTrainedInit(net, seqTrainxz, seqValxz,  seqTrainxzT)

InitResultMatrix = zeros(4, 4, 5);

for run = (1:5)
    predictTest = 0;

    % Train 
    [Xs, Xi, Ai, Ts] = preparets(net, seqTrainxz, seqTrainxzT);
    trainedNet = train(net, Xs, Ts, Xi, Ai);

    % Validation
    predictTest_pack = trainedNet(seqValxz);
    predictTest = cell2mat(predictTest_pack);
    
    % Unpack x,z into 4 Movements
    properConfusionPredict =shrinkConfusion(predictTest);
    
    % Store in the 4 x 4 x 5 Matrix for all 5 runs
    InitResultMatrix(:, :, run) = properConfusionPredict;
end

% Average out into 4 x 4 x 1 Matrix
ResultMatrix = (InitResultMatrix(:, :, 1) + InitResultMatrix(:, :, 2) + InitResultMatrix(:, :, 3) + InitResultMatrix(:, :, 4) + InitResultMatrix(:, :, 5))/5;

end


