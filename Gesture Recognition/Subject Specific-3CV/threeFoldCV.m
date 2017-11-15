% 3 Fold Cross Validation
function[ trained3CVnet, predictTestT1, predictTestT2, predictTestT3, stackMovementTest] = threeFoldCV(net, P_C, P_T, P_R, P_D)
% -------------------------------------------------------------------------------------------------------------------------------
% Create a single matrix to stack up 4 movements per Person
[R1Train_C, R1Test_C, R2Train_C, R2Test_C, R3Train_C, R3Test_C] = roundData(P_C);
[M1Train_T, M1Test_T, M2Train_T, M2Test_T, M3Train_T, M3Test_T] = roundData(P_T);
[M1Train_R, M1Test_R, M2Train_R, M2Test_R, M3Train_R, M3Test_R] = roundData(P_R);
[M1Train_D, M1Test_D, M2Train_D, M2Test_D, M3Train_D, M3Test_D] = roundData(P_D);

% Fold #1 Train + Test Data
fold1Train = [ R1Train_C M1Train_T M1Train_R M1Train_D];
fold1Test = [ R1Test_C M1Test_T M1Test_R M1Test_D];

% To sequencial format
f1Train = con2seq(fold1Train);
f1Test = con2seq(fold1Test);

% Fold #2 Train + Test Data
fold2Train = [ R2Train_C M2Train_T M2Train_R M2Train_D];
fold2Test = [ R2Test_C M2Test_T M2Test_R M2Test_D];

% To sequencial format
f2Train = con2seq(fold2Train);
f2Test = con2seq(fold2Test);

% Fold #3 Train + Test Data
fold3Train = [ R3Train_C M3Train_T M3Train_R M3Train_D];
fold3Test = [ R3Test_C M3Test_T M3Test_R M3Test_D];

% To sequencial format
f3Train = con2seq(fold3Train);
f3Test = con2seq(fold3Test);

% Target
[ stackMovementTrain, stackMovementTest ] = movementTarget('3 Fold');

% To sequencial format
Mtrain = con2seq(stackMovementTrain);
Mtest = con2seq(stackMovementTest);
% -------------------------------------------------------------------------------------------------------------------------------
% TDNN prepare nets and train with 3 folds
% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Fold #1 
% Train 1
[X1s, X1i, A1i, T1s] = preparets(net, f1Train, Mtrain);
f1net = train(net, X1s, T1s, X1i, A1i);

% Test 1
predictTestT1_pack = f1net(f1Test);
predictTestT1 = cell2mat(predictTestT1_pack);

% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Fold #2
% Train 2
[X2s, X2i, A2i, T2s] = preparets(f1net, f2Train, Mtrain);
f2net = train(f1net, X2s, T2s, X2i, A2i);

% Test 2
predictTestT2_pack= f2net(f2Test);
predictTestT2 = cell2mat(predictTestT2_pack);

% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Fold #3
% Train 3
[X3s, X3i, A3i, T3s] = preparets(f2net, f3Train, Mtrain);
trained3CVnet= train(f2net, X3s, T3s, X3i, A3i);

% Save 3-CV Trained Net
save trained3CVnet;

% Test 3
predictTestT3_pack = trained3CVnet(f3Test);
predictTestT3 = cell2mat(predictTestT3_pack);


end