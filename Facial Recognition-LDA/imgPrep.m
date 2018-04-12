% Load in images to create image vectos for testing and training / each person

function [ train_img_vec, test_img_vec, train_Label, test_Label] = imgPrep(faceNum)
% Read in image values for each person
faceNumM = int2str(faceNum);
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

% Resize image into 10 x 10 pixels
resize1 = imresize(img1R,[10 10]);
resize2 = imresize(img2R,[10 10]);
resize3 = imresize(img3R,[10 10]);
resize4= imresize(img4R,[10 10]);
resize5 = imresize(img5R,[10 10]);
resize6 = imresize(img6R,[10 10]);
resize7 = imresize(img7R,[10 10]);
resize8 = imresize(img8R,[10 10]);
resize9 = imresize(img9R,[10 10]);
resize10 = imresize(img10R,[10 10]);

% Convert image pixels from unit8 to double
img1 = im2double(resize1);
img2 = im2double(resize2);
img3 = im2double(resize3);
img4= im2double(resize4);
img5 = im2double(resize5);
img6 = im2double(resize6);
img7 = im2double(resize7);
img8 = im2double(resize8);
img9 = im2double(resize9);
img10 = im2double(resize10);

% Randomly pick 5 for training and 5 for testing
data_all = (1:10);
trainDataPick = randperm(10,5);
testDataPick = setdiff(data_all, trainDataPick);

% Grab the images for training picks and convert each image into cell array
% representation
train_img_vec = [{eval(strcat('img', int2str(trainDataPick(1))))} {eval(strcat('img', int2str(trainDataPick(2))))} {eval(strcat('img', int2str(trainDataPick(3))))} ...
{eval(strcat('img', int2str(trainDataPick(4))))} {eval(strcat('img', int2str(trainDataPick(5))))} ];

% Train Label for each category
train_Label(1, 1:5) = faceNum;
%train_Label2(1, 1:length(sort_TrainCombo)) = faceNum;

% Same for testing picks 
test_img_vec = [{eval(strcat('img', int2str(testDataPick(1))))} {eval(strcat('img', int2str(testDataPick(2))))} {eval(strcat('img', int2str(testDataPick(3))))} ...
{eval(strcat('img', int2str(testDataPick(4))))} {eval(strcat('img', int2str(testDataPick(5))))}];

test_Label(1, 1:5) = faceNum;
%test_Label2(1, 1:length(sort_TestCombo)) = faceNum;

end