% ------------------------------------------------------------------------------------------------------------
% Final Project - Part B : Multi-Instance fusion ( LDA + PCA fusion )
% ------------------------------------------------------------------------------------------------------------

clc
close all
clear all

% Original PCA and LDA Model
[LDA_GI, LDA_Labels] = LDA_Main();
[PCA_GI, PCA_Labels] = PCA_Main();


% PCA Model Multi-instance -- Something still off
[PCA_GI_Instance, PCA_Labels_Instance] = PCA_Instance_Main();

% LDA Model Multi-instance
[LDA_GI_Instance, LDA_Labels_Instance] = LDA_Instance_Main();

% Plot ROC Curve
[LDA_roc, LDA_EER, LDA_area, LDA_EERthr, LDA_ALLthr]= ezroc3(LDA_GI, LDA_Labels);
[PCA_roc, PCA_EER, PCA_area, PCA_EERthr, PCA_ALLthr]= ezroc3(PCA_GI, PCA_Labels);
[LDA_Instance_roc, LDA_Instance_EER, LDA_Instance_area, LDA_Instance_EERthr, LDA_Instance_ALLthr]= ezroc3(LDA_GI_Instance, LDA_Labels_Instance);
[PCA_Instance_roc, PCA_Instance_EER, PCA_Instance_area, PCA_Instance_EERthr, PCA_Instance_ALLthr]= ezroc3(PCA_GI_Instance, PCA_Labels_Instance);

% FRR + FAR for each method
 [LDA_FRR, LDA_FAR] = Calc_FRR_FAR(LDA_roc);
 [PCA_FRR, PCA_FAR] = Calc_FRR_FAR(PCA_roc);
 [LDA_Instance_FRR, LDA_Instance_FAR] = Calc_FRR_FAR(LDA_Instance_roc);
 [PCA_Instance_FRR, PCA_Instance_FAR] = Calc_FRR_FAR(PCA_Instance_roc);

 
 % Plot FAR and FRR to compare Regular v.s. Multi-Instance Fusion
figure;
plot(LDA_FAR, LDA_FRR, 'LineWidth', 2);
title('LDA & PCA Regular v.s. Multi-Instance Fusion');
xlabel('FAR(FPR)');
ylabel('FRR(FNR)');
hold on;
plot(PCA_FAR, PCA_FRR, 'LineWidth', 2);
plot(LDA_Instance_FAR, LDA_Instance_FRR, 'LineWidth', 2);
plot(PCA_Instance_FAR, PCA_Instance_FRR, 'LineWidth', 2);

hold off;
legend('LDA', 'PCA', 'LDA Instance', 'PCA Instance');



