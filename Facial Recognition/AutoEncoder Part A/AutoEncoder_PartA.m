% --------------------------------------------------------------------------------------------
% Final Project - Facial Recognition : AutoEncoder
% Part A
% --------------------------------------------------------------------------------------------
clc
clear all

% Setup data for all categories and labeled them as One Hot
 [train_Shuffle_D, train_T, test_Shuffle_D, test_T] = OneHotLabel();
 
 % Autoencoder
[autoenc1, feature1, autoenc2, feature2] = autoEncoderModel(train_Shuffle_D, train_T, test_Shuffle_D, test_T);