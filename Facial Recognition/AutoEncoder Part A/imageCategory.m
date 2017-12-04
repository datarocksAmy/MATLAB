% Load in images to create image vectos for testing and training / each person

function [ train_img_vec, train_Label, test_img_vec, test_Label ] = imageCategory(faceNum)

% Read in image values for each person
faceNumM = int2str(faceNum);
img1= imread(strcat('faceImg\s', faceNumM, '\1.pgm'));
img2= imread(strcat('faceImg\s', faceNumM, '\2.pgm'));
img3= imread(strcat('faceImg\s', faceNumM, '\3.pgm'));
img4= imread(strcat('faceImg\s', faceNumM, '\4.pgm'));
img5= imread(strcat('faceImg\s', faceNumM, '\5.pgm'));
img6= imread(strcat('faceImg\s', faceNumM, '\6.pgm'));
img7= imread(strcat('faceImg\s', faceNumM, '\7.pgm'));
img8= imread(strcat('faceImg\s', faceNumM, '\8.pgm'));
img9= imread(strcat('faceImg\s', faceNumM, '\9.pgm'));
img10= imread(strcat('faceImg\s', faceNumM, '\10.pgm'));

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

% Same for testing picks 
test_img_vec = [{eval(strcat('img', int2str(trainDataPick(1))))} {eval(strcat('img', int2str(trainDataPick(2))))} {eval(strcat('img', int2str(trainDataPick(3))))} ...
{eval(strcat('img', int2str(trainDataPick(4))))}];
test_Label(1, 1:4) = faceNum;

end