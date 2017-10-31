% ---------------------------------------------
% Mini Project #2 - RBF Neural Nets ( Task #1 )
% ---------------------------------------------

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
% Testing 
Exact_test_output = sim(RBF_exact, testP);
% Validation
Exact_val_output =  sim(RBF_exact, valP);

% MSE Errors
Train_MSE_exact = mse(Exact_train_output - trainT);
Test_MSE_exact = mse(Exact_test_output - testT);
Validation_MSE_exact = mse(Exact_val_output - valT);

% Display Exact RBF Test MSE
fprintf("Test MSE for EXACT RBF : " );
disp(Test_MSE_exact);

% Confusion Matrix for Exact RBF
figure(1)
plotconfusion(Exact_train_output, trainT, "Exact Train", Exact_val_output, valT, "Exact Validation", Exact_test_output, testT, "Exact Test");
hold on;

% ------ Regular RBF Network Output -----
% Training
Reg_train_output = sim(RBF_regular, trainP);
% Testing 
Reg_test_output = sim(RBF_regular, testP);
% Validation
Reg_val_output =  sim(RBF_regular, valP);

% MSE Errors
Train_MSE_reg = mse(Reg_train_output - trainT);
Test_MSE_reg = mse(Reg_test_output - testT);
Validation_MSE_reg = mse(Reg_val_output - valT);

% Display Refular Test MSE
fprintf("Test MSE for REGULAR RBF : " );
disp(Test_MSE_reg);

% Confusion Matrix for Regular RBF
figure(2)
plotconfusion(Reg_train_output, trainT, "Regular Train", Reg_val_output, valT, "Regular Validation", Reg_test_output, testT, "Reggular Test");