% Calculate Genuine Scores

function [featureMatrixAgg, testProjectAgg] = PCA_train_test()

% Initialize vector 
GenuineVec = [];
featureMatrixAgg = [];
testProjectAgg = [];

    % Load Images to set up train and test data by person
    % Calculate Genuine Scores first
    for faceNum = 1 : 40
         [ trainData, testData, train_Label, test_Label, train_GLabel, testG_Label ] = imgPrepModeOne(faceNum, 0, 0);

        % Mode #1 - PCA
        [featureMatrix, testProject, GenuineScore] = PCA(trainData, testData);

        % Store each person's feature matrix in a multidimensional array
        featureMatrixAgg = cat(3, featureMatrixAgg, featureMatrix);
        testProjectAgg = cat(3, testProjectAgg, testProject);


    end
end
