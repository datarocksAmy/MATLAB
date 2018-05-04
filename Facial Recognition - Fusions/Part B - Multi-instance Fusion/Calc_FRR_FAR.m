% Calculate FRR and FAR from ROC
function [FRR, FAR] = Calc_FRR_FAR(roc)

% GAR and FAR from ROC
GAR = roc(1, :)';

% Get FRR and FAR
FRR = round((GAR + 1)*10^4)/10^4;
FAR = round((roc(2, :)')*10^4)/10^4;

end
