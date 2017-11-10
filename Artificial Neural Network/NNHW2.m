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

% Divide Param Ratio
net.divideParam.trainRatio = 0.6429;
net.divideParam.valRatio = 0.1587;
net.divideParam.testRatio = 0.1984;

% Train the Network
[net, tr] = train(net, TrainSetInput, TrainSetTarget);

% Test the Network
Testoutputs = net(TestSetInput);
errors = gsubtract(Testoutputs, TestSetTarget);
performance = perform(net, TestSetTarget, Testoutputs);

%figure, plotconfusion(TestSetTarget,Testoutputs)