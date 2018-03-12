% Principal Component Analysis (PCA Model)

%function [] = PCA(trainData, testData)

% Unpack Cell to Vector
trainData_V = cell2mat(trainData);
testData_V = cell2mat(testData);

% Get size of matrix
[trainRow, trainCol] = size(trainData_V);
[testRow, testCol] = size(testData_V);

% Calculate the mean for each person's img data
%[trainDMean, testDMean] = MeanCalc(trainData, testData);
trainMean = mean((trainData_V)')';
testMean = mean((testData_V)')';

% Center the train data ( img - mean for each person's imgs )
trainCenter = trainData_V - repmat(trainMean,1,trainCol);

% Calculate Covariance Matrix
train_CoVar = trainCenter * trainCenter';

% Calculate Eignevalues and Eigenvectors
[ eigvector,eignval ] = eig(train_CoVar);

% Sort eigenvector in descending order by correspoding eigenvalue
eigval_diagnal = diag(eignval);
[other, index] = sort(eigval_diagnal,'descend');
eigval_diagnal = eigval_diagnal(index);
eigvector_sort = eigvector(:, index);

% Pick out eigen values based on threshold
countNumEig = 0;
for count = 1:size(eigval_diagnal,1)
    if(eigval_diagnal(count)>0)     
        countNumEig = countNumEig + 1;
    end
end

% Filtered eigen vectors
filteredEigVec = eigvector_sort(:, 1:countNumEig);

% Calculate Feature Matrix (Train Projected Space)
featureMatrix = filteredEigVec' * trainCenter;

% Center the test data ( img - mean for each person's imgs )
testCenter = testData_V - repmat(testMean,1,testCol);

% Project testing data to the Train Projected Space
testProject = testCenter' * eigvector_sort;

% Predicted labels from the test data
testProjectPredict = testProject';
testProjectPredict_M(2:size(featureMatrix,2)+1,:) = featureMatrix';
dist=pdist(testProjectPredict_M);
[a,b]=min(dist(:,1:size(featureMatrix,2)));

%end