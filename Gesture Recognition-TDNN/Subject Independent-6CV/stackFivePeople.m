% Stack 2 designated rounds for Training and set aside 1 person for Testing 

function[P1_data, P2_data,P3_data, P4_data, P5_data, P6_data] = stackFivePeople( P1_xz, P2_xz, P3_xz,P4_xz,P5_xz,P6_xz)

% Person 1
P1_data =  [P1_xz(1:2, :), P1_xz(3:4, :), P1_xz(5:6, :)];

% Person 2
P2_data =  [P2_xz(1:2, :), P2_xz(3:4, :), P2_xz(5:6, :)];

% Person 3
P3_data =  [P3_xz(1:2, :), P3_xz(3:4, :), P3_xz(5:6, :)];

% Person 4
P4_data =  [P4_xz(1:2, :), P4_xz(3:4, :), P4_xz(5:6, :)];

% Person 5
P5_data =  [P5_xz(1:2, :), P5_xz(3:4, :), P5_xz(5:6, :)];

% Person 6
P6_data=  [P6_xz(1:2, :), P6_xz(3:4, :), P6_xz(5:6, :)];

end