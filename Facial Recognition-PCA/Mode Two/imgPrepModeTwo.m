% Load in images to create image vectos for testing and training / each person

function [ first_img_vec, second_img_vec, img_vec ] = imgPrepModeTwo()

% Initialize vectors
first_img_vec = [];
second_img_vec = [];
img_vec = [];

for faceNum = 1:40
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

% After 25 people, load as testing data
if faceNum > 25
    
    first_img_vec_P = [{eval(strcat('img', int2str(1)))} {eval(strcat('img', int2str(2)))} {eval(strcat('img', int2str(3)))} ...
{eval(strcat('img', int2str(4)))} {eval(strcat('img', int2str(5)))}];
    second_img_vec_P = [ {eval(strcat('img', int2str(6)))} {eval(strcat('img', int2str(7)))} ...
{eval(strcat('img', int2str(8)))} {eval(strcat('img', int2str(9)))} {eval(strcat('img', int2str(10)))}];
    
    first_img_vec = [first_img_vec ; first_img_vec_P];
    second_img_vec = [second_img_vec ; second_img_vec_P];
else
    
% Grab the images (Person 1- 25) for training.
% Convert each image into cell array representation.
img_vec_person = [{eval(strcat('img', int2str(1)))} {eval(strcat('img', int2str(2)))} {eval(strcat('img', int2str(3)))} ...
{eval(strcat('img', int2str(4)))} {eval(strcat('img', int2str(5)))} {eval(strcat('img', int2str(6)))} {eval(strcat('img', int2str(7)))} ...
{eval(strcat('img', int2str(8)))} {eval(strcat('img', int2str(9)))} {eval(strcat('img', int2str(10)))} ];

img_vec = [img_vec; img_vec_person];

end


end
end