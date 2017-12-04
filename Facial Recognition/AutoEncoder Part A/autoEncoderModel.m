function [autoenc1, feature1, autoenc2, feature2] = autoEncoderModel(train_Shuffle_D, train_T, test_Shuffle_D, test_T)
 
% Autoencoder
 hiddenSize1 = 100;
 
 % Train First AutoEncoder
autoenc1 = trainAutoencoder(train_Shuffle_D,hiddenSize1, ...
    'MaxEpochs',400, ...
    'L2WeightRegularization',0.004, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.15, ...
    'ScaleData', false);

% Visualize weights of the first AutoEncoder
figure(1)
plotWeights(autoenc1);

% Generate Features from the first AutoEncoder
feature1 = encode(autoenc1, train_Shuffle_D);

% Train Second AutoEncoder
hiddenSize2 = 50;
autoenc2 = trainAutoencoder(feature1,hiddenSize2, ...
    'MaxEpochs',200, ...
    'L2WeightRegularization',0.002, ...
    'SparsityRegularization',1, ...
    'SparsityProportion',0.3, ...
    'ScaleData', false);

% Generate Second Set of Features by passing the previous feature
feature2 = encode(autoenc2,feature1);

% Train Final Layer : Softmax
softmax = trainSoftmaxLayer(feature2, train_T,'MaxEpochs',400);

% Stacked Nerual Network
StackedDeepNet = stack(autoenc1, autoenc2, softmax);

% Reshape pixels in each image in the testing data
imageWidth = 112;
imageHeight = 92;
inputSize = imageWidth*imageHeight;

% Convert the test images into vectors and store in a matrix
convertTest = zeros(inputSize,numel(test_Shuffle_D));
for i = 1:numel(test_Shuffle_D)
    convertTest(:,i) = test_Shuffle_D{i}(:);
end

% Confusion Matrix
predictTest = StackedDeepNet(convertTest);
plotconfusion(test_T,predictTest);
set(findobj(gca,'type','text'),'fontsize',4.5) 

% Fine Tune the Model 
xTrain = zeros(inputSize,numel(train_Shuffle_D));
for i = 1:numel(train_Shuffle_D)
    xTrain(:,i) = train_Shuffle_D{i}(:);
end

% Creat the deep net
deepnet = train(StackedDeepNet,xTrain,train_T);

predictTest_DN = deepnet(convertTest);
plotconfusion(test_T,predictTest_DN);
set(findobj(gca,'type','text'),'fontsize',4.5) 
end