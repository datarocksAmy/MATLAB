% Stack 2 designated rounds for Training and set aside 1 round for Testing  per movement

function[R1Train, R1Test, R2Train, R2Test, R3Train, R3Test] = roundData(P_movement)

% Fold #1 -- Training : Round 1 & 2 + Testing : Round 3
R1Train =  [P_movement(1, :), P_movement(3, :) ; P_movement(2, :), P_movement(4, :)];
R1Test  =  [P_movement(5, :) ; P_movement(6, :)];

% Fold #2 -- Training : Round 2 & 3 + Testing : Round 1
R2Train =  [P_movement(3, :), P_movement(5, :) ; P_movement(4, :), P_movement(6, :)];
R2Test  =  [P_movement(1, :) ; P_movement(2, :)];

% Fold #3 -- Training : Round 1 & 3 + Testing : Round 2
R3Train =  [P_movement(1, :), P_movement(5, :) ; P_movement(2, :), P_movement(6, :)];
R3Test  =  [P_movement(3, :) ; P_movement(4, :)]; 

end