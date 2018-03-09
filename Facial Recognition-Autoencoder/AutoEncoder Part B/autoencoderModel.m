function [autoenc1, feature1, autoenc2, feature2, predictTest, predictTrain] = autoencoderModel(trainData, train_person_T, testData)

% Autoencoder
 hiddenSize1 = 100;
 
 % Train First AutoEncoder
autoenc1 = trainAutoencoder(trainData,hiddenSize1, ...
    'MaxEpochs',400, ...
    'L2WeightRegularization',0.006, ...
    'SparsityRegularization',5, ...
    'SparsityProportion',0.2, ...
    'ScaleData', false);

% Visualize weights of the first AutoEncoder
figure(1)
plotWeights(autoenc1);

% Generate Features from the first AutoEncoder
feature1 = encode(autoenc1, trainData);

% Train Second AutoEncoder
hiddenSize2 = 50;
autoenc2 = trainAutoencoder(feature1,hiddenSize2, ...
    'MaxEpochs',200, ...
    'L2WeightRegularization',0.004, ...
    'SparsityRegularization',1, ...
    'SparsityProportion',0.4, ...
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
