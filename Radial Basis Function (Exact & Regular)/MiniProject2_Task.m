% --------------------------------------------------
% Mini Project #2 - RBF Neural Nets ( Task #1 + #2 )
% --------------------------------------------------

clear all;
clc;

% Load formatted input and target data
load('P.mat');
load('T.mat');

% Splipt Input Data & Store indexes ( 60% Train, 20% Validation, 20% Test )
[trainP, valP, testP, trainIdx, valIdx, testIdx] = dividerand(P, 0.6, 0.2, 0.2);	

% Split Target Data  ( 60% Train, 20% Validation, 20% Test )
[trainT, valT, testT] =	divideind(T, trainIdx, valIdx, testIdx);

% Goal and spread from Simulation
goal = 5;
spread = 19;

% Build two RBF	Neural Nets ( Exact + Regular Base )
RBF_exact	= newrbe(trainP, trainT, spread);
RBF_regular	= newrb(trainP, trainT, goal, spread, 200, 50);

% ------ Exact RBF Network Output -----
% Training
Exact_train_output = sim(RBF_exact, trainP);
% Validation
Exact_val_output =  sim(RBF_exact, valP);
% Testing 
Exact_test_output = sim(RBF_exact, testP);

% Parse output & target data into two classes for Malignant & Benign 
[exact_train_output_m, exact_trainT_m] = parseData(Exact_train_output,trainT);
[exact_val_output_m, exact_valT_m] = parseData(Exact_val_output,valT);
[exact_test_output_m, exact_testT_m] = parseData(Exact_test_output,testT);

% MSE Errors
Train_MSE_exact = mse(Exact_train_output - trainT);
Validation_MSE_exact = mse(Exact_val_output - valT);
Test_MSE_exact = mse(Exact_test_output - testT);

% Display Exact RBF Test MSE
fprintf('Test MSE for EXACT RBF : ');
disp(Test_MSE_exact);

% Confusion Matrix for Exact RBF ( Train, Validation, Test )
figure(1)
hold on
plotconfusion(exact_train_output_m, exact_trainT_m, 'Exact RBF Train', exact_val_output_m, exact_valT_m, 'Exact RBF Validation', exact_test_output_m, exact_testT_m, 'Exact RBF Test');
hold off;

% ROC for Exact RBF ( Train, Validation, Test )
hold on
figure(2)
plotroc(exact_train_output_m, exact_trainT_m);
title('Exact RBF Train ROC');

figure(3)
plotroc(exact_val_output_m, exact_valT_m);
title('Exact RBF Validation ROC');

figure(4)
plotroc(exact_test_output_m, exact_testT_m);
title('Exact RBF Test ROC');

hold off;


%plotroc(testT,Exact_test_output);
% ------ Regular RBF Network Output -----
% Training
Reg_train_output = sim(RBF_regular, trainP);
% Validation
Reg_val_output =  sim(RBF_regular, valP);
% Testing 
Reg_test_output = sim(RBF_regular, testP);


% Parse output & target data into two classes for Malignant & Benign 
[reg_train_output_m, exac_trainT_m] = parseData(Reg_train_output,trainT);
[reg_val_output_m, reg_valT_m] = parseData(Reg_val_output,valT);
[reg_test_output_m, reg_testT_m] = parseData(Reg_test_output,testT);


% MSE Erro
Train_MSE_reg = mse(Reg_train_output - trainT);
Validation_MSE_reg = mse(Reg_val_output - valT);
Test_MSE_reg = mse(Reg_test_output - testT);

% Display Refular Test MSE
fprintf('Test MSE for REGULAR RBF : ');
disp(Test_MSE_reg);

% Confusion Matrix for Regular RBF
figure(5)
hold on
plotconfusion(reg_train_output_m, exac_trainT_m, 'Reg RBF Train', reg_val_output_m, reg_valT_m, 'Reg RBF Validation', reg_test_output_m, reg_testT_m, 'Reg RBF Test');
hold off;

% ROC for Regular RBF ( Train, Validation, Test )
hold on
figure(6)
plotroc(reg_testT_m, reg_test_output_m);
title('Regular RBF Train ROC');

figure(7)
plotroc(reg_val_output_m, reg_valT_m);
title('Regular RBF Validation ROC');

figure(8)
plotroc(reg_test_output_m, reg_testT_m);
title('Regular RBF Test ROC');

hold off;


