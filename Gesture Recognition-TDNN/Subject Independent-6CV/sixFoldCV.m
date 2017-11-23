% 6 Fold Cross Validation
function[ trained6CVnet, predictTestT1, predictTestT2, predictTestT3, predictTestT4, predictTestT5, predictTestT6, stackMovementTest]... 
                                                                                                                                        = sixFoldCV(net, P1_data, P2_data, P3_data,P4_data,P5_data,P6_data)
% -------------------------------------------------------------------------------------------------------------------------------
% Fold #1 Train (1-5) + Test Data (6)
fold1Train = [ P1_data, P2_data,P3_data, P4_data, P5_data ];
fold1Test = [ P6_data ];

% To sequencial format
f1Train = con2seq(fold1Train);
f1Test = con2seq(fold1Test);

% ====================================================
% Fold #2 Train(1-4, 6) + Test Data (5)
fold2Train = [ P1_data, P2_data,P3_data, P4_data, P6_data ];
fold2Test = [ P5_data];

% To sequencial format
f2Train = con2seq(fold2Train);
f2Test = con2seq(fold2Test);
% ====================================================
% Fold #3 Train(1-3, 5,6) + Test Data (4)
fold3Train = [ P1_data, P2_data,P3_data, P5_data, P6_data ];
fold3Test = [ P4_data ];

% To sequencial format
f3Train = con2seq(fold3Train);
f3Test = con2seq(fold3Test);
% ====================================================
% Fold #4 Train(1-2, 4-6) + Test Data (3)
fold4Train = [ P1_data, P2_data,P4_data, P5_data, P6_data ];
fold4Test = [ P3_data ];

% To sequencial format
f4Train = con2seq(fold4Train);
f4Test = con2seq(fold4Test);
% ====================================================
% Fold #5 Train(1, 3-6) + Test Data (2)
fold5Train = [ P1_data, P3_data,P4_data, P5_data, P6_data ];
fold5Test = [ P2_data ];

% To sequencial format
f5Train = con2seq(fold5Train);
f5Test = con2seq(fold5Test);
% ====================================================
% Fold #6Train(2-6) + Test Data (1)
fold6Train = [ P2_data, P3_data,P4_data, P5_data, P6_data ];
fold6Test = [ P1_data];

% To sequencial format
f6Train = con2seq(fold6Train);
f6Test = con2seq(fold6Test);
% ====================================================
% Target
[ stackMovementTrain, stackMovementTest ] = movementTarget('6 Fold');

% To sequencial format
Mtrain = con2seq(stackMovementTrain);
Mtest = con2seq(stackMovementTest);
% -------------------------------------------------------------------------------------------------------------------------------
% TDNN prepare nets and train with 6 folds
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
f3net= train(f2net, X3s, T3s, X3i, A3i);

% Test 3
predictTestT3_pack = f3net(f3Test);
predictTestT3 = cell2mat(predictTestT3_pack);

% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Fold #4
% Train 4
[X4s, X4i, A4i, T4s] = preparets(f3net, f4Train, Mtrain);
f4net= train(f3net, X4s, T4s, X4i, A4i);

% Test 4
predictTestT4_pack = f4net(f4Test);
predictTestT4 = cell2mat(predictTestT4_pack);
% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Fold #5
% Train 5
[X5s, X5i, A5i, T5s] = preparets(f4net, f5Train, Mtrain);
f5net= train(f4net, X5s, T5s, X5i, A5i);

% Test 5
predictTestT5_pack = f5net(f5Test);
predictTestT5 = cell2mat(predictTestT5_pack);
% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Fold #6
% Train 6
[X6s, X6i, A6i, T6s] = preparets(f5net, f6Train, Mtrain);
trained6CVnet= train(f5net, X6s, T6s, X6i, A6i);

% Test 6
predictTestT6_pack = trained6CVnet(f6Test);
predictTestT6 = cell2mat(predictTestT6_pack);

end