% ------------------------------------------------------------------------------------------------------------
% Final Project - Part B : Multi-Instance fusion ( LDA + PCA fusion )
% ------------------------------------------------------------------------------------------------------------

clc
close all
clear all

% Original PCA and LDA Model
[LDA_GI, LDA_Labels] = LDA_Main();
ezroc3(LDA_GI, LDA_Labels);
[PCA_GI, PCA_Labels] = PCA_Main();
ezroc3(PCA_GI, PCA_Labels);


% PCA Model Multi-instance -- Something still off
[PCA_GI_Instance, PCA_Labels_Instance] = PCA_Instance_Main();
ezroc3(PCA_GI_Instance', PCA_Labels_Instance);

% LDA Model Multi-instance
[LDA_GI_Instance, LDA_Labels_Instance] = LDA_Instance_Main();
ezroc3(LDA_GI_Instance, LDA_Labels_Instance);



