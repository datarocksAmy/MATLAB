% Confusion Matrix for every folds in a single graph -- 6CV
function confusionROCcommittee6CV(predictTestT1, predictTestT2, predictTestT3, predictTestT4, predictTestT5, predictTestT6, stackMovementTest)

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
saveas(figure(1), [pwd '\Committee_6CV\Fold1ROC.fig']);
ezroc3( predictT2_4by4 );
saveas(figure(2), [pwd '\Committee_6CV\Fold2ROC.fig']);
ezroc3( predictT3_4by4 );
saveas(figure(3), [pwd '\Committee_6CV\Fold3ROC.fig']);
ezroc3( predictT4_4by4 );
saveas(figure(4), [pwd '\Committee_6CV\Fold4ROC.fig']);
ezroc3( predictT5_4by4 );
saveas(figure(5), [pwd '\Committee_6CV\Fold5ROC.fig']);
ezroc3( predictT6_4by4 );
saveas(figure(6), [pwd '\Committee_6CV\Fold6ROC.fig']);
ezroc3( overall );
saveas(figure(7), [pwd '\Committee_6CV\OverallROC.fig']);

% Plot Confusion Matrix
% Class 1/--1 to 1/0
movementLabel = [ stackMovementTest stackMovementTest stackMovementTest ];
InitMovemntTestModify = (movementLabel + 1 )/2;
sixDataStack = [predictTestT1 predictTestT2 predictTestT3 predictTestT4 predictTestT5 predictTestT6];
PredTestModify = (sixDataStack  + 1)/2;

% Plot Confusion Matrix
confusionG = plotconfusion(InitMovemntTestModify, PredTestModify);

% Save the matrix
saveas(confusionG, [pwd '\Committee_6CV\Confusion.fig'])
end