% Parse x, z for each round for each movements

function [R1_x, R1_z, R2_x, R2_z, R3_x, R3_z] = combExcelData(fileName, sheetName)

% Load in all data from Person Excel File by Different Sheet Name
personSheetsData = xlsread(fileName, sheetName);

% Slice Round 1 x and z Columns
R1_x = personSheetsData(:,1);
R1_z = personSheetsData(:,3);

% Slice Round 2 x and z Columns
R2_x = personSheetsData(:,5);
R2_z = personSheetsData(:,7);

% Slice Round 3 x and z Columns
R3_x = personSheetsData(:,9);
R3_z = personSheetsData(:,11);

% Concatenate all 3 Rounds of x and z into one column for each
%AllRound_x = cat(1, Round1_x, Round2_x, Round3_x);
%AllRound_z = cat(1, Round1_z, Round2_z, Round3_z);

end

