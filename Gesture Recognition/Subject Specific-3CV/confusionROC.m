% Confusion Matrix for each fold in a single graph
function confusionROC(person, predictTestT1, predictTestT2, predictTestT3, stackMovementTest)

% Resize the matrix to 4x4 for the prediction output by calling function
% 'shrinkConfusion'
predictT1_4by4 = shrinkConfusion(predictTestT1);
predictT2_4by4 = shrinkConfusion(predictTestT2);
predictT3_4by4 = shrinkConfusion(predictTestT3);
overall = shrinkConfusion(cat(3, predictTestT1, predictTestT2, predictTestT3));

% Plot ROC Curves for all three rounds individually and an overall ROC +
% Save to folders!
ezroc3( predictT1_4by4 );
saveas(figure(1), [pwd '\ROC\3CV\', person , '\', person, '_Fold1ROC.fig']);
ezroc3( predictT2_4by4 );
saveas(figure(2), [pwd '\ROC\3CV\', person , '\',  person, '_Fold2ROC.fig']);
ezroc3( predictT3_4by4 );
saveas(figure(3), [pwd '\ROC\3CV\', person , '\', person, '_Fold3ROC.fig']);
ezroc3( overall );
saveas(figure(4), [pwd '\ROC\3CV\', person , '\', person, '_OverallROC.fig']);

% Plot Confusion Matrix
% Class 1/--1 to 1/0
InitMovemntTestModify = (stackMovementTest + 1 )/2;
lastRPredTestModify = (predictTestT3 + 1)/2;

confusionG = plotconfusion(InitMovemntTestModify, lastRPredTestModify, person);
saveas(confusionG, [pwd '\ROC\3CV\', person , '\',  person, '_Confusion.fig'])
end