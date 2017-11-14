% 3 Fold Cross Validation
function[ trained3CVnet, predictTestT, originalTestT ] = threeFoldCV(net, P_C, P_T, P_R, P_D)

% Create a single matrix to stack up 4 movements per Person
[R1Train_C, R1Test_C, R2Train_C, R2Test_C, R3Train_C, R3Test_C] = roundData(P_C);
[M1Train_T, M1Test_T, M2Train_T, M2Test_T, M3Train_T, M3Test_T] = roundData(P_T);
[M1Train_R, M1Test_R, M2Train_R, M2Test_R, M3Train_R, M3Test_R] = roundData(P_R);
[M1Train_D, M1Test_D, M2Train_D, M2Test_D, M3Train_D, M3Test_D] = roundData(P_D);

% Fold #1 Train + Test Data
fold1Train = [ R1Train_C M1Train_T M1Train_R M1Train_D];
fold1Test = [ R1Test_C M1Test_T M1Test_R M1Test_D];

% Fold #2 Train + Test Data
fold2Train = [ R2Train_C M2Train_T M2Train_R M2Train_D];
fold2Test = [ R2Test_C M2Test_T M2Test_R M2Test_D];

% Fold #3 Train + Test Data
fold3Train = [ R3Train_C M3Train_T M3Train_R M3Train_D];
fold3Test = [ R3Test_C M3Test_T M3Test_R M3Test_D];

% Target
[ stackMovementTrain, stackMovementTest ] = movementTarget('3 Fold');

% TDNN prepare nets and train 3 folds
[xs, xi, ai, Ts] = preparets(net, fold1Train, stackMovementTrain);

end