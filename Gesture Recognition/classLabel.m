% Categorical labels for all 4 movements of data

function[ xLabel, zLabel, allXLabel, allZLabel ] = classLabel(movement)
% Categorical name to number based on movement

if strcmp(movement, 'Circle') == 1
    move = 1;
elseif strcmp(movement, 'Triangle') == 1
    move = 2;
elseif strcmp(movement, 'Right') == 1
    move = 3;
else
    move =4;
end

% Generate columns of labels for x and z
xL(1:300) = move;
zL(1: 300) = move;


xLabel = xL';
zLabel = zL';

allXLabel = cat(1, xLabel, xLabel, xLabel);
allZLabel = cat(1, zLabel, zLabel, zLabel);

end
