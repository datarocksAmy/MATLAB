% Set up Train, Test Data and build LDA Model
function[V, eigvector_sort, eigenVal, trainImg, testImg] = LDAModel()

% Initialize 
trainImg = [];
testImg = [];
trainImg_mean_class = [];
SB = zeros(10, 10);
SW = zeros(10, 10);

 % Load in Images & Calculate Mean for Each Class
for faceNum = 1:40
     [ train_img_vec, test_img_vec, train_Label, test_Label ] = imgPrep(faceNum);
     trainImg = cat(3, trainImg, cell2mat(train_img_vec'));
     testImg = cat(3, testImg, cell2mat(test_img_vec'));    
     
     % Calculate the mean for each class
     trainImg_mean_class = [trainImg_mean_class; mean(trainImg(:, :, faceNum))];
     
end

% Num of Observations for each class -- per image or per pixels ?
% Average all mean classes
mu = mean(trainImg_mean_class);

% Center the data (data-mean)
for idx = 1:40
    center = (trainImg(:, :, idx))-repmat(trainImg_mean_class(idx, :),size(trainImg(:, :, idx),1),1);
    %trainImg_center = cat(3, trainImg_center, center);    
    
    % Calculate the within class variance (SW)
    within_class_var = center'*center;
    SW = SW + within_class_var;
    
end

% SW
inv_SW=inv(SW);

% Calculate between class variance (SB)
for trainImgC = 1:40
    between_class_var = size(trainImg(:, :, trainImgC),1) * (trainImg_mean_class(trainImgC, :)-mu)'* (trainImg_mean_class(trainImgC,:)-mu);
   %SB = cat(3, SB, between_class_var);
   SB = SB +between_class_var;
end

% Calculate V
V = inv_SW * SB;

% Get Eigenvalue and Eigenvectors of V
[eigenVec, eigenVal] = eig(V);

eigval_diagnal = diag(eigenVal);
[other, index] = sort(eigval_diagnal,'descend');
eigval_diagnal = eigval_diagnal(index);
eigvector_sort = eigenVec(:, index);

% Pick out eigen values based on threshold
countNumEig = 0;
for count = 1:size(eigval_diagnal,1)
    if(eigval_diagnal(count)>0)     
        countNumEig = countNumEig + 1;
    end
end

% Filtered eigen vectors
filteredEigVec = eigvector_sort(:, 1:countNumEig);

end