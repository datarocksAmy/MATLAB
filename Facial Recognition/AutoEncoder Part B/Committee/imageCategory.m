% Load in images to create image vectos for testing and training / each person

function [ train_img_vec, test_img_vec, train_Label, test_Label, train_Label2, test_Label2] = imageCategory(faceNum, sort_TrainCombo, sort_TestCombo)

% Read in image values for each person
faceNumM = int2str(faceNum);
faceNumM = int2str(1);
img1R= imread(strcat('faceImg\s', faceNumM, '\1.pgm'));
img2R= imread(strcat('faceImg\s', faceNumM, '\2.pgm'));
img3R= imread(strcat('faceImg\s', faceNumM, '\3.pgm'));
img4R= imread(strcat('faceImg\s', faceNumM, '\4.pgm'));
img5R= imread(strcat('faceImg\s', faceNumM, '\5.pgm'));
img6R= imread(strcat('faceImg\s', faceNumM, '\6.pgm'));
img7R= imread(strcat('faceImg\s', faceNumM, '\7.pgm'));
img8R= imread(strcat('faceImg\s', faceNumM, '\8.pgm'));
img9R= imread(strcat('faceImg\s', faceNumM, '\9.pgm'));
img10R= imread(strcat('faceImg\s', faceNumM, '\10.pgm'));

% Resize image into 90 x 90 pixels
resize1 = imresize(img1R,[90 90]);
resize2 = imresize(img2R,[90 90]);
resize3 = imresize(img3R,[90 90]);
resize4= imresize(img4R,[90 90]);
resize5 = imresize(img5R,[90 90]);
resize6 = imresize(img6R,[90 90]);
resize7 = imresize(img7R,[90 90]);
resize8 = imresize(img8R,[90 90]);
resize9 = imresize(img9R,[90 90]);
resize10 = imresize(img10R,[90 90]);

% Convert image pixels from unit8 to double
img1 = im2double(img1R);
img2 = im2double(img2R);
img3 = im2double(img3R);
img4= im2double(img4R);
img5 = im2double(img5R);
img6 = im2double(img6R);
img7 = im2double(img7R);
img8 = im2double(img8R);
img9 = im2double(img9R);
img10 = im2double(img10R);

% Randomly pick 6 for training and 4 for testing
data_all = (1:10);
trainDataPick = randperm(10,6);
testDataPick = setdiff(data_all, trainDataPick);

% Grab the images for training picks and convert each image into cell array
% representation
train_img_vec = [{eval(strcat('img', int2str(trainDataPick(1))))} {eval(strcat('img', int2str(trainDataPick(2))))} {eval(strcat('img', int2str(trainDataPick(3))))} ...
{eval(strcat('img', int2str(trainDataPick(4))))} {eval(strcat('img', int2str(trainDataPick(5))))} {eval(strcat('img', int2str(trainDataPick(6))))}];

% Train Label for each category
train_Label(1, 1:6) = faceNum;
train_Label2(1, 1:length(sort_TrainCombo)) = faceNum;

% Same for testing picks 
test_img_vec = [{eval(strcat('img', int2str(trainDataPick(1))))} {eval(strcat('img', int2str(trainDataPick(2))))} {eval(strcat('img', int2str(trainDataPick(3))))} ...
{eval(strcat('img', int2str(trainDataPick(4))))}];

test_Label(1, 1:4) = faceNum;
test_Label2(1, 1:length(sort_TestCombo)) = faceNum;

end