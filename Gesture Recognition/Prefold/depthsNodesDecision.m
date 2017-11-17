% Train with 3 different depths and 3 different number of nodes = 9 combo

% Different combinations of depths and number of nodes
depthInput = [15, 30, 60];
numNodes = [5, 15, 30];
% Labels
[ MovementTrain, MovementTest ] = movementTarget('Prefold');

% Generate 9 different nets for all possible combinations
for depthIdx = (1:3)
    for nodeIdx = (1:3)
        % Train with 3 different depths and 3 different number of nodes
        TDNNnet = timedelaynet(1:depthInput(depthIdx), numNodes(nodeIdx), 'trainbr');
        TDNNnet.layers{2}.transferFcn = 'tansig';
        TDNNnet.divideParam.testRatio = 0;
        TDNNnet.trainParam.epochs = 100;

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
        [ InitResultMatrix ] = fiveTrainedInit(TDNNnet, seqTrainxz, seqValxz,  seqTrainxzT);
        
        % Save 9 Different TDNN Nets
        count = 1;
        
        % Initialize Empty Vectors
        comboMatrix = zeros(4, 4, 9);
        
        % Keep Track of depth and number of nodes
        netname = strcat('Depth', int2str(depthInput(depthIdx)), 'NodeNum', int2str(numNodes(nodeIdx)), '_Net');

        % Store Matrix
         comboMatrix(:, :, count) = InitResultMatrix;
         
         % Save Net
         save(netname ,'TDNNnet');
         count  = count + 1;
               
    end
end
