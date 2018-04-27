% Calculate Genuine Scores

function [featureMatrixAgg, testProjectAgg] = PCA_Process

% Initialize vector 
featureMatrixAgg = [];
testProjectAgg = [];
trainImg_mean_class = [];
testImg_mean_class = [];
train_center_all = [];
test_center_all = [];
trainImg = [];
testImg = [];

% Load Images to set up train and test data by person
for faceNum = 1:40
     [ train_img_vec, test_img_vec, train_Label, test_Label ] = imgPrep(faceNum);
     trainImg = cat(3, trainImg, cell2mat(train_img_vec));
     testImg = cat(3, testImg, cell2mat(test_img_vec));    
     
     % Calculate the mean for each class
     trainImg_mean_class = [trainImg_mean_class; mean(trainImg(:, :, faceNum))];
     testImg_mean_class = [testImg_mean_class; mean(testImg(:, :, faceNum))];
     
end

% Average all mean classes
     mu_train = mean(trainImg_mean_class);
     mu_test = mean(testImg_mean_class);

% Center the data (data-mean)
for idx = 1:40
    train_center = (trainImg(:, :, idx))-repmat(trainImg_mean_class(idx, :),size(trainImg(:, :, idx),1),1);
    test_center = (testImg(:, :, idx))-repmat(testImg_mean_class(idx, :),size(testImg(:, :, idx),1),1);
    
    % Store centers for each class
    train_center_all = [train_center_all; train_center];
    test_center_all = [test_center_all; test_center];
    
end

% Calculate Covariance Matrix
    train_co_var = train_center_all'*train_center_all;
    test_co_var = test_center_all'*test_center_all;

% Calculate Eignevalues and Eigenvectors
[ eigvector,eignval ] = eig(train_co_var);

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
featureMatrix = train_co_var' * train_center_all';

% Project testing data to the Train Projected Space
testProject = test_co_var' * test_center_all';

for i = 1:40
 % Store each person's feature matrix in a multidimensional array
featureMatrixAgg = cat(3, featureMatrixAgg, featureMatrix(:, (i-1)*10+1:i*10));
testProjectAgg = cat(3, testProjectAgg, testProject(:, (i-1)*10+1:i*10));
end

end
