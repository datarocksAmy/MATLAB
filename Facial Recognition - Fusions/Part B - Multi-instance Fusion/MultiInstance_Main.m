% ------------------------------------------------------------------------------------------------------------
% Final Project - Part B : Multi-Instance fusion ( LDA + PCA fusion )
% ------------------------------------------------------------------------------------------------------------

clc
close all
clear all

% Original PCA and LDA Model



% PCA Model Multi-instance -- Something still off
[PCA_GI_Instance, PCA_Labels_Instance] = PCA_Instance_Main();
ezroc3(PCA_GI_Instance', PCA_Labels_Instance);

% LDA Model Multi-instance
[LDA_GI_Instance, LDA_Labels_Instance] = LDA_Instance_Main();
ezroc3(LDA_GI_Instance, LDA_Labels_Instance);



