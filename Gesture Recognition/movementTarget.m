% One Hot Target for all 4 Movements
function[ stackMovementT ] = movementTarget()

% Vectors for 1s ( is Class ) and -1s ( Not Class ) 
isClass = ones(1,300);
notClass = -ones(1,300);

% Circle
CTarget = [isClass, notClass, notClass, notClass];

% Triangle
TTarget = [notClass, isClass, notClass, notClass];

% Right
RTarget = [notClass, notClass, isClass, notClass];

% Down
DTarget = [notClass, notClass, notClass, isClass];

% Stack all 4 movements of targets 
movementT = [CTarget; TTarget; RTarget; DTarget];

