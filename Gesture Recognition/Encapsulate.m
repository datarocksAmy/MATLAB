% Encapsulate all data into 2 matrices + create Target Labels:
% 1. Combine data by 3 Rounds, 4 Sheets for 6 Different Indivisuals
% 2. Create 2 matrices : One for all 3 rounds of x, z data for per person
%                        One for concatenate rounds of x, z into two
%                        columns for per person as well

function [XZ_data, catXZ_data] = Encapsulate(fileName)
% 4 Movements of x, z for all 3 Rounds + Columns for all x and z from 3 Rounds
xLabel = (ones(1, 300))';
zLabel = (-ones(1, 300))';
allxLabel = cat(1, xLabel, xLabel, xLabel);
allzLabel = cat(1, zLabel, zLabel, zLabel);

% Circle
[R1C_x, R1C_z, R2C_x, R2C_z, R3C_x, R3C_z, AllC_x, AllC_z] = combExcelData(fileName, 'Circle');
circle_xz = {R1C_x, xLabel, R1C_z, zLabel, R2C_x,  xLabel, R2C_z, zLabel, R3C_x, xLabel, R3C_z, zLabel};

% Triangle
[R1T_x, R1T_z, R2T_x, R2T_z, R3T_x, R3T_z, AllT_x, AllT_z] = combExcelData(fileName, 'Triangle');
triangle_xz = {R1T_x, xLabel, R1T_z, zLabel, R2T_x, xLabel, R2T_z, zLabel, R3T_x, xLabel, R3T_z, zLabel};

% Right
[R1R_x, R1R_z, R2R_x, R2R_z, R3R_x, R3R_z, AllR_x, AllR_z] = combExcelData(fileName, 'Right');
right_xz = {R1R_x, xLabel, R1R_z, zLabel, R2R_x, xLabel, R2R_z, zLabel, R3R_x, xLabel, R3R_z, zLabel, };

% Down
[R1D_x, R1D_z, R2D_x, R2D_z, R3D_x, R3D_z, AllD_x, AllD_z] = combExcelData(fileName, 'Down');
down_xz = {R1D_x, xLabel, R1D_z, zLabel, R2D_x, xLabel, R2D_z, zLabel, R3D_x, xLabel, R3D_z, zLabel};

% header = {'P1 Circle x', 'P1 Circle z', 'P1 Triangle x', 'P1 Triangle z', 'P1 Right x', 'P1 Down z', 'P1 Right x', 'P1 Down z'};
% Put 3 Rounds of x, z for all 4 movements into one matrix
XZ_data = [cell2mat(circle_xz), cell2mat(triangle_xz), cell2mat(right_xz), cell2mat(down_xz)]';

% Put concatenate x, z for all 4 movements into one matrix
all_xz = {AllC_x, allxLabel, AllC_z, allzLabel ,AllT_x, allxLabel, AllT_z, allzLabel, AllR_x, allxLabel, AllR_z, allzLabel, AllD_x, allxLabel, AllD_z, allzLabel};
catXZ_data = (cell2mat(all_xz))';

end