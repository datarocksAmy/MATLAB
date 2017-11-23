% Train with 2 different input delay lines, 2 hidden layer size, and 3
% different output delay lines 
% Under rule input delay has to be longer than output delay, total
% combination : 8

function inputHiddenOutputDelay(P2_xz)

% Different combinations of input delay, hidden layer and output delay
inputDelay = [15, 30];
hiddenLayer = [15, 30];
outputDelay = [10, 23, 28];
count = 1;

% Generate 8 different nets for all possible combinations, excluding the
% cases where input is shorter than output delay line

% Input Delay Lines
for inputIdx = (1:2)
    % Hidden Layer Size
    for hiddenIdx = (1:2)
        % Output Delay Lines
        for outputIdx = (1:3)
                % Only create the net when the output delay lines is shorter
                % than input delay lines
                if outputDelay(outputIdx) < inputDelay(inputIdx)
                    % Train with 2 different input delay lines, 3 different output
                    % delay lines and 2 different hidden layer size
                    NARXnet = narxnet(1:inputDelay(inputIdx), 1:outputDelay(outputIdx), hiddenLayer(hiddenIdx), 'open','trainbr');
                    NARXnet.layers{2}.transferFcn = 'tansig';
                    NARXnet.divideParam.testRatio = 0;
                    NARXnet.trainParam.epochs = 100;

                    % Set up Training : Round 1 | Validation : Round 2
                    trainxz = [ P2_xz(1:2, 1:300) P2_xz(3:4, 1:300) P2_xz(5:6, 1:300) P2_xz(7:8, 1:300) ];
                    valxz= [ P2_xz(1:2, 301:600) P2_xz(3:4, 301:600) P2_xz(5:6, 301:600) P2_xz(7:8, 301:600) ];

                    % Set up target values ( class : 1 | not-class : -1 )
                    [ stackMovementTrain, stackMovementVal ] = movementTarget('Prefold');

                    % To sequencial format
                    seqTrainxz = con2seq( trainxz );
                    seqTrainxzT = con2seq( stackMovementTrain );
                    seqValxz = con2seq( valxz );

                   % 5 Simulation Matrices then Average 5 dimension 4 x 4 to 1 dimension
                    [  initPredMatrix, Result4by4Matrix, stackFiveMatrixAvg ] = fiveTrainedInit(NARXnet, seqTrainxz, seqValxz,  seqTrainxzT);

                    % Initialize Empty Vectors
                    comboMatrix = zeros(4, 4, 9);

                    % Keep Track of depth and number of nodes
                    %netname = strcat('InDelay', int2str(inputDelay(inputIdx)),'FeedDelay', int2str(outputDelay(outputIdx)), 'Hidden', int2str(hiddenLayer(hiddenIdx)), '_Net');
                    Cnetname = strcat('InDelay', int2str(inputDelay(inputIdx)),'FeedDelay', int2str(outputDelay(outputIdx)), 'Hidden', int2str(hiddenLayer(hiddenIdx)), '_CNet');

                    % Store Matrix
                     comboMatrix(:, :, count) = Result4by4Matrix;

                     % Plot + Save ROC + Confusion Matrix 
                     prefoldConfusionROC(stackMovementVal , initPredMatrix, stackFiveMatrixAvg, Cnetname, count); 

                     % Save Net
                     save(Cnetname ,'NARXnet');
                     fprintf('Trained finished', '\n');
                     count  = count + 1;
                end
        end
    end
end
                  
end