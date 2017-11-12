% Encapsulate all data into 2 matrices + create Target Labels:
% 1. Combine data by 3 Rounds, 4 Sheets for 6 Different Indivisuals
% 2. Create 2 matrices : One for all 3 rounds of x, z data for per person
%                        One for concatenate rounds of x, z into two
%                        columns for per person as well

function [XZ_data, catXZ_data] = Encapsulate(fileName)
% 4 Movements of x, z for all 3 Rounds + Columns for all x and z from 3 Rounds
% Label movements for all data points
[CxLabel, CzLabel, CxAllLabel, CzAllLabel] = classLabel('Circle');
[TxLabel, TzLabel, TxAllLabel, TzAllLabel] = classLabel('Triangle');
[RxLabel, RzLabel, RxAllLabel, RzAllLabel] = classLabel('Right');
[DxLabel, DzLabel, DxAllLabel, DzAllLabel] = classLabel('Down');

% Circle
[R1C_x, R1C_z, R2C_x, R2C_z, R3C_x, R3C_z, AllC_x, AllC_z] = combExcelData(fileName, 'Circle');
circle_xz = {R1C_x, CxLabel, R1C_z, CzLabel, R2C_x,  CxLabel, R2C_z, CzLabel, R3C_x, CxLabel, R3C_z, CzLabel};

% Triangle
[R1T_x, R1T_z, R2T_x, R2T_z, R3T_x, R3T_z, AllT_x, AllT_z] = combExcelData(fileName, 'Triangle');
triangle_xz = {R1T_x, TxLabel, R1T_z, TzLabel, R2T_x, TxLabel, R2T_z, TzLabel, R3T_x, TxLabel, R3T_z, TzLabel};

% Right
[R1R_x, R1R_z, R2R_x, R2R_z, R3R_x, R3R_z, AllR_x, AllR_z] = combExcelData(fileName, 'Right');
right_xz = {R1R_x, RxLabel, R1R_z, RzLabel, R2R_x, RxLabel, R2R_z, RzLabel, R3R_x, RxLabel, R3R_z, RzLabel };

% Down
[R1D_x, R1D_z, R2D_x, R2D_z, R3D_x, R3D_z, AllD_x, AllD_z] = combExcelData(fileName, 'Down');
down_xz = {R1D_x, DxLabel, R1D_z, DzLabel, R2D_x, DxLabel, R2D_z, DzLabel, R3D_x, DxLabel, R3D_z, DzLabel};

% header = {'P1 Circle x', 'P1 Circle z', 'P1 Triangle x', 'P1 Triangle z', 'P1 Right x', 'P1 Down z', 'P1 Right x', 'P1 Down z'};
% Put 3 Rounds of x, z for all 4 movements into one matrix
XZ_data = [cell2mat(circle_xz), cell2mat(triangle_xz), cell2mat(right_xz), cell2mat(down_xz)]';

% Put concatenate x, z for all 4 movements into one matrix
all_xz = {AllC_x, CxAllLabel, AllC_z, CzAllLabel ,AllT_x, TxAllLabel, AllT_z, TzAllLabel, AllR_x, RxAllLabel, AllR_z, RzAllLabel, AllD_x, DxAllLabel, AllD_z, DzAllLabel};
catXZ_data = (cell2mat(all_xz))';

end