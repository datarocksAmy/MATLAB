% Encapsulate all data into 2 matrices : x and z per Person

function [P_xz] = EncapsulatePerson(fileName)

% Circle
[R1C_x, R1C_z, R2C_x, R2C_z, R3C_x, R3C_z] = combExcelData(fileName, 'Circle');
circle_xz = [R1C_x,  R1C_z; R2C_x, R2C_z; R3C_x, R3C_z]';

% Triangle
[R1T_x, R1T_z, R2T_x, R2T_z, R3T_x, R3T_z] = combExcelData(fileName, 'Triangle');
triangle_xz = [R1T_x,  R1T_z; R2T_x, R2T_z; R3T_x, R3T_z]';

% Right
[R1R_x, R1R_z, R2R_x, R2R_z, R3R_x, R3R_z] = combExcelData(fileName, 'Right');
right_xz = [R1R_x, R1R_z; R2R_x, R2R_z; R3R_x, R3R_z]';

% Down
[R1D_x, R1D_z, R2D_x, R2D_z, R3D_x, R3D_z] = combExcelData(fileName, 'Down');
down_xz = [R1D_x, R1D_z; R2D_x, R2D_z; R3D_x, R3D_z]';

% Stack up 4 movements for Person's x,z
P_xz = [circle_xz; triangle_xz;  right_xz; down_xz];

end