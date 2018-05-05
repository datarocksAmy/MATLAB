% -------------------------------------------------------------------------------------
% Final Project - Part A : Multi-classifier fusion ( LDA + PCA fusion )
% -------------------------------------------------------------------------------------

clc
close all
clear all


% LDA Model
[LDA_GI, LDA_Labels] = LDA_Main();

% PCA Model
[PCA_GI, PCA_Labels] = PCA_Main();

% MSC Score Fusion
% Average of LDA & PCA
AVG_ScoreFusion_GI = (LDA_GI + PCA_GI)/2;
% Minimum of LDA v.s. PCA
MIN_ScoreFusion_GI = min(LDA_GI, PCA_GI);
% Maximum of LDA v.s. PCA
MAX_ScoreFusion_GI = max(LDA_GI, PCA_GI);

% Plot ROC Curve
[LDA_roc,LDA_EER,LDA_area,LDA_EERthr,LDA_ALLthr]= ezroc3(LDA_GI, LDA_Labels);
[PCA_roc,PCA_EER,PCA_area,PCA_EERthr,PCA_ALLthr]= ezroc3(PCA_GI, PCA_Labels);
[AVG_roc,AVG_EER,AVG_area,AVG_EERthr,AVG_ALLthr]= ezroc3(AVG_ScoreFusion_GI, PCA_Labels);
[MIN_roc,MIN_EER,MIN_area,MIN_EERthr,MIN_ALLthr]= ezroc3(MIN_ScoreFusion_GI, PCA_Labels);
[MAX_roc,MAX_EER,MAX_area,MAX_EERthr,MAX_ALLthr]= ezroc3(MAX_ScoreFusion_GI, PCA_Labels);

% FRR + FAR for each method
 [LDA_FRR, LDA_FAR] = Calc_FRR_FAR(LDA_roc);
 [PCA_FRR, PCA_FAR] = Calc_FRR_FAR(PCA_roc);
 [AVG_FRR, AVG_FAR] = Calc_FRR_FAR(AVG_roc);
 [MIN_FRR, MIN_FAR] = Calc_FRR_FAR(MIN_roc);
 [MAX_FRR, MAX_FAR] = Calc_FRR_FAR(MAX_roc);
 
 % Plot FAR and FRR for all methods
figure;
plot(LDA_FAR, LDA_FRR, 'LineWidth', 2);
title({'[ LDA & PCA Models ]'; 'Regular v.s. Score-Level Fusion'});
xlabel('FAR(FPR)');
ylabel('FRR(FNR)');
hold on;
plot(PCA_FAR, PCA_FRR, 'LineWidth', 2);
plot(AVG_FAR, AVG_FRR, 'LineWidth', 2);
plot(MIN_FAR, MIN_FRR, 'LineWidth', 2);
plot(MAX_FAR, MAX_FRR, 'LineWidth', 2);
hold off;
legend('LDA', 'PCA', 'AVG', 'MIN', 'MAX');