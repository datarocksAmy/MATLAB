% Plot and save ROC and Confusion Matrix for Pre-fold
function prefoldConfusionROC(stackMovementVal , InitResultMatrix, stackFiveMatrixAvg, netname, count)

% ROC Curve + Save

ezroc3(InitResultMatrix);
saveas(figure(count), [pwd '\Prefold\ROC\', netname , '_ROC.jpg']);
saveas(figure(count+1), [pwd '\Prefold\ROC\', netname , '_ROC.fig']);

% Plot Confusion Matrix
% Class 1/--1 to 1/0
InitMovemntValModify = (stackMovementVal + 1 )/2;
comboPredModify = (stackFiveMatrixAvg + 1)/2;

% Plot Confusion Matrix
confusionPre = plotconfusion(InitMovemntValModify, comboPredModify);

% Save the matrix
saveas(confusionPre, [pwd '\Prefold\Confusion\', netname , '_Confusion.jpg'])
saveas(confusionPre, [pwd '\Prefold\Confusion\', netname , '_Confusion.fig'])

end