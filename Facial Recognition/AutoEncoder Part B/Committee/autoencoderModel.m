% AutoEncoder Model

function [autoenc1, feature1, autoenc2, feature2, predictTest, predictTrain] = ...
autoencoderModel(trainData, train_person_T, testData, combo)

% Committee Hidden Size 1 & 2
hiddenSize1List = [100, 140, 100];
hiddenSize2List = [50, 70, 50];

% Committee L2 1 & 2
L2One = [0.006, 0.004, 0.008];
L2Two = [0.004, 0.002, 0.006];

% Committee Sparsity Regularization 1 & 2
SparReg1 = [5, 4, 6];
SparReg2 = ones(1, 3);

% Committee Sparsity Proportion 1 & 2
SparProp1 = [0.2, 0.15, 0.1];
SparProp2 = [0.4, 0.3, 0.2];

% Autoencoder
 hiddenSize1 = hiddenSize1List(combo);
 
 % Train First AutoEncoder
autoenc1 = trainAutoencoder(trainData,hiddenSize1, ...
    'MaxEpochs',400, ...
    'L2WeightRegularization',L2One(combo), ...
    'SparsityRegularization',SparReg1(combo), ...
    'SparsityProportion',SparProp1(combo), ...
    'ScaleData', false);

% Visualize weights of the first AutoEncoder
figure(1)
plotWeights(autoenc1);

% Generate Features from the first AutoEncoder
feature1 = encode(autoenc1, trainData);

% Train Second AutoEncoder
hiddenSize2 = hiddenSize2List(combo);
autoenc2 = trainAutoencoder(feature1,hiddenSize2, ...
    'MaxEpochs',200, ...
    'L2WeightRegularization',L2Two(combo), ...
    'SparsityRegularization',SparReg2(combo), ...
    'SparsityProportion',SparProp2(combo), ...
    'ScaleData', false);

% Generate Second Set of Features by passing the previous feature
feature2 = encode(autoenc2,feature1);

% Train Final Layer using Loss Function Cross Enropy
cross_entropy = trainSoftmaxLayer(feature2, train_person_T, ... 
    'MaxEpochs',400, 'LossFunction', 'crossentropy');

% Stacked Nerual Network
StackedDeepNet = stack(autoenc1, autoenc2, cross_entropy);

% Reshape pixels in each image in the testing data
imageWidth = 112;
imageHeight = 92;
inputSize = imageWidth*imageHeight;
convertTrain = zeros(inputSize,numel(trainData));

for i = 1:numel(trainData)
    convertTrain(:,i) = trainData{i}(:);
end

predictTrain = StackedDeepNet(convertTrain);

% Convert the test images into vectors and store in a matrix
convertTest = zeros(inputSize,numel(testData));
for i = 1:numel(testData)
    convertTest(:,i) = testData{i}(:);
end

% Test Output
predictTest = StackedDeepNet(convertTest);
