% ---------------------------------------------------------------------------------
% Mini Project #1 - a : 10 Nodes in 1 Hidden Later. 
%                       Training (80%), Validation(20%) and Testing(0%).
%                       Mean and variance of MSEs for training, validation
%                       and testing.
% ---------------------------------------------------------------------------------

% Load dataset
load bodyfat_dataset;

% Variable X and T
[X,T] = bodyfat_dataset;

% Fitting Network
hiddenLayerSize = 1;

% Build the Net
net = fitnet(hiddenLayerSize);

% Number of Neurons in layer
net.layers{1}.size = 10;

% Number of Epochs
net.trainParam.epochs = 10;

% Data Vector excluded 50 testing 
allData = (1:202);

% Indexes
validate = datasample(1:202, 40);
testData = 202:252;
trainData = setdiff(allData,validate);

% Train Input and Target
TrainSetInput = X(trainData);
TrainSetTarget = T(trainData);

% Test Input and Target
TestSetInput = X(testData);
TestSetTarget = T(testData);

% Validation
ValidateInput = X(validate);
ValidateTarget = T(validate);

% Divide Param Ratio
net.divideParam.trainRatio = 0.8;
net.divideParam.valRatio = 0.2;
net.divideParam.testRatio = 0;

% Train the Network
[net, tr] = train(net, TrainSetInput, TrainSetTarget);

% Train Outputs
TrainOutputs = net(TrainSetInput);

% Test the Network
TestOutputs = net(TestSetInput);

% Validate Output
ValidateOutputs = net(ValidateInput);

% Errors and Performance
TrainErrors = gsubtract(TrainOutputs, TrainSetTarget);
TestErrors = gsubtract(TestOutputs, TestSetTarget);
ValidateErrors = gsubtract(ValidateOutputs, ValidateTarget);
performance = perform(net, TestSetTarget, TestOutputs);

%figure, plotconfusion(TestSetTarget,Testoutputs)
% MSEs
TrainMSE = mse(net, TrainSetTarget, TrainOutputs, 'regularization',0.01);
TestMSE = mse(net, TestSetTarget, TestOutputs, 'regularization',0.01);
ValidationMSE = mse(net, ValidateTarget, ValidateOutputs, 'regularization',0.01);

% Mean Errors
meanTrainE = mean(TrainErrors);
meanTestE = mean(TestErrors);
meanValidateE = mean(ValidateErrors);

% Variance Errors
varTrainE = var(TrainErrors);
varTestE = var(TestErrors);
varValidateE = var(ValidateErrors);
