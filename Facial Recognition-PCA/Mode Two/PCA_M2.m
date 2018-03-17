% Principal Component Analysis (PCA Model)

function [featureMatrixAgg, testProjectAgg, GenuineVec] = PCA_M2(first_img_vec, second_img_vec, img_vec )
test_img_vec = [first_img_vec, second_img_vec];

% Unpack Cell to Vector
trainData_V = cell2mat(img_vec);
%testData_V = cell2mat(test_img_vec);
testData_Validation = cell2mat(test_img_vec);

% Get size of matrix
[trainRow, trainCol] = size(trainData_V);
[testRow, testCol] = size(testData_Validation);

% Calculate the mean for each person's img data
trainMean = mean((trainData_V)')';
testMean = mean((testData_Validation)')';

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

% ---------------------------------- Validation ----------------------------------
% Initialize vector 
GenuineVec = [];
featureMatrixAgg = [];
testProjectAgg = [];

for row = 1:15
% Unpack Cell to Vector
testData_Project = cell2mat(first_img_vec(row, :));
testData_Validation = cell2mat(second_img_vec(row, :));

% Get size of matrix
[testRow_P, testCol_P] = size(testData_Project);
[testRow, testCol] = size(testData_Validation);

% Calculate the mean for each person's img data
testData_Project_Mean = mean((testData_Project)')';
testMean = mean((testData_Validation)')';

% Center the train data ( img - mean for each person's imgs )
testProjectCenter = testData_Project - repmat(testData_Project_Mean,1,testCol_P);

% Calculate Covariance Matrix
testProject_CoVar = testProjectCenter * testProjectCenter';

% Calculate Eignevalues and Eigenvectors
[ eigvector_Project,eignval_Project ] = eig(testProject_CoVar);

% Sort eigenvector in descending order by correspoding eigenvalue
eigval_diagnal_P = diag(eignval_Project);
[other, index] = sort(eigval_diagnal_P,'descend');
eigval_diagnal_P = eigval_diagnal_P(index);
eigvector_sort_P = eigvector_Project(:, index);

% Pick out eigen values based on threshold
countNumEig = 0;
for cNum = 1:size(eigval_diagnal_P,1) 
    if(eigval_diagnal_P(cNum)>0)     
        countNumEig = countNumEig + 1;
    end
end

% Filtered eigen vectors
filteredEigVec_P = eigvector_sort_P(:, 1:countNumEig);

% Calculate Feature Matrix (Train Projected Space)
featureMatrix_P = filteredEigVec_P' * testProjectCenter;

% Center the test data ( img - mean for each person's imgs )
testCenter = testData_Validation - repmat(testMean,1,testCol);

% Project testing data to the Train Projected Space
testProject = filteredEigVec_P' * testCenter;

% Genuine Scores
GenuineScore  = pdist2(featureMatrix_P, testProject, 'euclidean');
GenuineVec = [GenuineVec; GenuineScore];

% Store each person's feature matrix in a multidimensional array
featureMatrixAgg = cat(3, featureMatrixAgg, featureMatrix_P);
testProjectAgg = cat(3, testProjectAgg, testProject);
    

end
end