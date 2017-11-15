% One Hot Target for all 4 Movements
function[ stackMovementTrain, stackMovementTest ] = movementTarget(foldType)

% Vectors for 1s ( is Class ) and -1s ( Not Class ) 
isClass = ones(1,300);
notClass = -ones(1,300);

% Target for 3 CV
if strcmp(foldType, '3 Fold') == 1
% Circle
CTarget_Train = [isClass, notClass, notClass, notClass, isClass, notClass, notClass, notClass];
CTarget_Test = [isClass, notClass, notClass, notClass];

% Triangle
TTarget_Train = [notClass, isClass, notClass, notClass, notClass, isClass, notClass, notClass];
TTarget_Test = [notClass, isClass, notClass, notClass];

% Right
RTarget_Train = [notClass, notClass, isClass, notClass, notClass, notClass, isClass, notClass];
RTarget_Test = [notClass, notClass, isClass, notClass];

% Down
DTarget_Train = [notClass, notClass, notClass, isClass, notClass, notClass, notClass, isClass];
DTarget_Test = [notClass, notClass, notClass, isClass];

% Stack all 4 movements of targets for Training and Testing
stackMovementTrain = [CTarget_Train; TTarget_Train; RTarget_Train; DTarget_Train];
stackMovementTest = [CTarget_Test; TTarget_Test; RTarget_Test; DTarget_Test];

end
end