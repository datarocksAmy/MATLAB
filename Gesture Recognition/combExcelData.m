% Function for combing through data by 3 Rounds, 4 Sheets for different People

function [Round1_x, Round1_z, Round2_x, Round2_z, Round3_x, Round3_z, All_x, All_z] = combExcelData(fileName, sheetName)

% Load in all data from Person Excel File by Different Sheet Name
personSheetsData = xlsread(fileName, sheetName);

% Slice Round 1 x and z Columns
Round1_x = personSheetsData(:,1);
Round1_z = personSheetsData(:,3);

% Slice Round 2 x and z Columns
Round2_x = personSheetsData(:,5);
Round2_z = personSheetsData(:,7);

% Slice Round 3 x and z Columns
Round3_x = personSheetsData(:,9);
Round3_z = personSheetsData(:,11);

% Concatenate all 3 Rounds of x and z into one column for each
All_x = cat(1, Round1_x, Round2_x, Round3_x);
All_z = cat(1, Round1_z, Round2_z, Round3_z);

end

