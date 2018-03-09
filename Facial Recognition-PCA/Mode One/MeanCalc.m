% Reshape input vector from 1 x 200 to 40 x 5 
% Calculate mean value for each person

%function[trainDMean, testDMean] = MeanCalc(trainData, testData)

% Initialize vectors to store train and test means 
trainDMean = [];
testDMean = [];


% Break 1 row into 40 rows and calculate the imgs mean for each person
for people = 1:40
    
    % Calculate mean of the features for each person on Test and Train
    trainImgMean_person = mean(trainData{people,1} + trainData{people,2} + trainData{people,3} + trainData{people,4} + trainData{people,5});
    testImgMean_person = mean(testData{people,1} + testData{people,2} + testData{people,3} + testData{people,4} + testData{people,5});
    
    % Store in vectors
    trainDMean = [trainDMean; trainImgMean_person];
    testDMean = [testDMean; testImgMean_person];
    
    
    
end

%end