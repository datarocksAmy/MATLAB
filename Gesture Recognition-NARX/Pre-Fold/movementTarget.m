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

stackMovementTrain = [CTarget_Train; TTarget_Train; RTarget_Train; DTarget_Train];
stackMovementTest = [CTarget_Test; TTarget_Test; RTarget_Test; DTarget_Test];

% Target for 6 CV
elseif strcmp(foldType, '6 Fold') == 1
isClass6CV = ones(1,900);
notClass6CV = -ones(1,900);
% Circle
C = [isClass6CV, notClass6CV, notClass6CV, notClass6CV];
CTarget_Train = repmat(C, 1, 5);
CTarget_Test = C;

% Triangle
T = [notClass6CV, isClass6CV, notClass6CV, notClass6CV];
TTarget_Train =  repmat(T, 1, 5);
TTarget_Test =  T;

% Right
R = [notClass6CV, notClass6CV, isClass6CV, notClass6CV];
RTarget_Train =repmat(R, 1, 5);
RTarget_Test = R;

% Down
D = [notClass6CV, notClass6CV, notClass6CV, isClass6CV];
DTarget_Train =repmat(D, 1, 5);
DTarget_Test = D;

% Stack all 4 movements of targets for Training and Testing
stackMovementTrain = [CTarget_Train; TTarget_Train; RTarget_Train; DTarget_Train];
stackMovementTest = [CTarget_Test; TTarget_Test; RTarget_Test; DTarget_Test];

% Target for Prefold
elseif strcmp(foldType, 'Prefold') == 1
preTarget_C = [isClass, notClass, notClass, notClass];    
preTarget_T = [notClass, isClass, notClass, notClass];    
preTarget_R = [notClass, notClass, isClass, notClass];    
preTarget_D = [notClass, notClass, notClass, isClass];    

stackMovementTrain = [preTarget_C; preTarget_T; preTarget_R; preTarget_D];
stackMovementTest = [preTarget_C; preTarget_T; preTarget_R; preTarget_D];

end
end