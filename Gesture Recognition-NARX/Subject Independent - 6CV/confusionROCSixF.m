% Confusion Matrix for every folds in a single graph -- 6CV
function confusionROCSixF(predictTestT1, predictTestT2, predictTestT3, predictTestT4, predictTestT5, predictTestT6, stackMovementTest)

% Resize the matrix to 4x4 for the prediction output by calling function
% 'shrinkConfusion'
predictT1_4by4 = slashConfusion(predictTestT1);
predictT2_4by4 = slashConfusion(predictTestT2);
predictT3_4by4 = slashConfusion(predictTestT3);
predictT4_4by4 = slashConfusion(predictTestT4);
predictT5_4by4 = slashConfusion(predictTestT5);
predictT6_4by4 = slashConfusion(predictTestT6);
overall = slashConfusion(cat(6, predictTestT1, predictTestT2, predictTestT3, predictTestT4, predictTestT5, predictTestT6));

% Plot ROC Curves for all three rounds individually and an overall ROC +
% Save to folders!
ezroc3( predictT1_4by4 );
saveas(figure(1), [pwd '\6CV\Fold1ROC.fig']);
ezroc3( predictT2_4by4 );
saveas(figure(2), [pwd '\6CV\Fold2ROC.fig']);
ezroc3( predictT3_4by4 );
saveas(figure(3), [pwd '\6CV\Fold3ROC.fig']);
ezroc3( predictT4_4by4 );
saveas(figure(4), [pwd '\6CV\Fold4ROC.fig']);
ezroc3( predictT5_4by4 );
saveas(figure(5), [pwd '\6CV\Fold5ROC.fig']);
ezroc3( predictT6_4by4 );
saveas(figure(6), [pwd '\6CV\Fold6ROC.fig']);
ezroc3( overall );
saveas(figure(7), [pwd '\6CV\OverallROC.fig']);

% Plot Confusion Matrix
% Class 1/--1 to 1/0
InitMovemntTestModify = (stackMovementTest + 1 )/2;
lastRPredTestModify = (predictTestT6 + 1)/2;

% Plot Confusion Matrix
confusionG = plotconfusion(InitMovemntTestModify, lastRPredTestModify);

% Save the matrix
saveas(confusionG, [pwd '\6CV\Confusion.fig'])
end