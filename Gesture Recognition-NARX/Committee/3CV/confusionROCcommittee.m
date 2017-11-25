% Plot confusion matrix and ROC for 3 different NARX nets results
function confusionROCcommittee(person, predictTestT1, predictTestT2, predictTestT3, stackMovementTest)

% Resize the matrix to 4x4 for the prediction output by calling function
% 'shrinkConfusion'
predictT1_4by4 = shrinkConfusion(predictTestT1);
predictT2_4by4 = shrinkConfusion(predictTestT2);
predictT3_4by4 = shrinkConfusion(predictTestT3);
overall = shrinkConfusion(cat(3, predictTestT1, predictTestT2, predictTestT3));

% Plot ROC Curves for all three rounds individually and an overall ROC +
% Save to folders!
ezroc3( predictT1_4by4);
saveas(figure(1), [pwd '\committee\', person , '\', person, '_net1ROC.fig']);
ezroc3( predictT2_4by4 );
saveas(figure(2), [pwd '\committee\', person , '\',  person, '_net2ROC.fig']);
ezroc3( predictT3_4by4 );
saveas(figure(3), [pwd '\committee\', person , '\', person, '_net3ROC.fig']);
ezroc3( overall );
saveas(figure(4), [pwd '\committee\', person , '\', person, '_triNetROC.fig']);

% Plot Confusion Matrix
% Class 1/--1 to 1/0
threeDataStack = [ predictTestT1 predictTestT2 predictTestT3 ] ;
movementLabel = [ stackMovementTest stackMovementTest stackMovementTest ];
InitMovemntTestModify = (movementLabel + 1 )/2;
PredTestModify = (threeDataStack + 1)/2;

% Plot Confusion Matrix
confusionG = plotconfusion(InitMovemntTestModify, PredTestModify, person);
% Save the matrix
saveas(confusionG, [pwd '\committee\', person , '\',  person, '_Confusion.fig'])
end