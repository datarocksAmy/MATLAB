% Plot and save ROC and Confusion Matrix for Pre-fold
function prefoldConfusionROC(stackMovementVal , comboMatrix, netname)

% ROC Curve + Save
ezroc3(comboMatrix);
saveas(figure(1), [pwd '\ROC\Prefold\ROC\', netname , '_ROC.fig']);

% Plot Confusion Matrix
% Class 1/--1 to 1/0
InitMovemntValModify = (stackMovementVal + 1 )/2;
comboPredModify = (comboMatrix + 1)/2;

% Plot Confusion Matrix
confusionPre = plotconfusion(InitMovemntValModify, comboPredModify);

% Save the matrix
saveas(confusionPre, [pwd '\ROC\Prefold\Confusion', netname , '_Confusion.fig'])

end