% Calculate bags for test and train images

function [testBag, trainBag] = bag_features(testImg, trainImg)

% Initialize 
testBag = [];
trainBag = [];

% Take average of the test images of each classes (row + col) into ONE single number
%numRows_test = size(testImg(:, :, 1), 1);

for person = 1:40
    imgMean_temp_test = [];
    imgMean_temp_train = [];
    
    for imgCount = 1:5
        % Calculate feature means by rows per image
        rowMean_test = mean(testImg(1:10,10*(imgCount-1)+1:10*imgCount, person));
        rowMean_train = mean(trainImg(1:10, 10*(imgCount-1)+1:10*imgCount, person));
        
        % Calculate by column
        colMean_test = mean(rowMean_test);
        colMean_train = mean(rowMean_train);
        
        % Store temp image features
        imgMean_temp_test = [imgMean_temp_test, colMean_test];
        imgMean_temp_train = [imgMean_temp_train, colMean_train];
    end
    
    % Save the testImg means for each image into a 3D matrix
    testBag = cat(3, testBag, imgMean_temp_test');
    trainBag = cat(3, trainBag, imgMean_temp_train');
end


end