% Train 5 times for the Initial Net
function[ initPredMatrix, Result4by4Matrix, stackFiveMatrixAvg ] = fiveTrainedInit(net, seqTrainxz, seqValxz,  seqTrainxzT)

initPredMatrix = zeros(4, 4, 5);
stackFiveMatrix = zeros(4,1200, 5);

for run = (1:5)
    predictTest = 0;

    % Train 
    [Xs, Xi, Ai, Ts] = preparets(net, seqTrainxz, { },  seqTrainxzT);
    trainedNet = train(net, Xs, Ts, Xi, Ai);

    % Validation
    netc= closeloop(trainedNet);
    predictTest_pack = netc(seqValxz);
    
   % predictTest_pack = trainedNet(seqValxz, xic, aic);
    predictTest = cell2mat(predictTest_pack);
    
    % Stack up all prediction data into 4 rows
    stackFiveMatrix(:, :, run) = predictTest;
    
    % Unpack x,z into 4 Movements
    properConfusionPredict =shrinkConfusion(predictTest);
    
    % Store in the 4 x 4 x 5 Matrix for all 5 runs
    initPredMatrix(:, :, run) = properConfusionPredict;
   
end


% Average out into 4 x 4 x 1 Matrix
Result4by4Matrix = (initPredMatrix(:, :, 1) + initPredMatrix(:, :, 2) + initPredMatrix(:, :, 3) + initPredMatrix(:, :, 4) + initPredMatrix(:, :, 5))/5;
stackFiveMatrixAvg = (stackFiveMatrix(:, :, 1) + stackFiveMatrix(:, :, 2) + stackFiveMatrix(:, :, 3) + stackFiveMatrix(:, :, 4) + stackFiveMatrix(:, :, 5))/5;
end


