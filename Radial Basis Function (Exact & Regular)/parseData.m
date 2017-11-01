% Function for labeling Malignant and Benign as 1 if classify correctly

function [modify_output, modify_T] = parseData(original_output, original_T)

% Get total row number
%colNum = size(Reg_test_output, 1);
rowNum = size(original_output, 2);

% Initialize both modify vector with 2 rows of 0 values
modify_output = zeros(2, rowNum);
modify_T = zeros(2, rowNum);

% Initialize row from 1
row = 1;

% Start parsing the data in each row
while row <= rowNum
    % Split into two row mark as 1(yes) and 0(no) for Malignant & Benign
    if (original_output(1, row) == mode(original_output))
        modify_output(2, row) = 1; % Malignant (1)
    else
        modify_output(1, row) = 1; % Benign (-1) 
    end
    
    % Transform original input into two rows
    if(original_T(1,row) == -1)
        modify_T(1, row) = 1; % Benign
    else
        modify_T(2, row) = 1; % Malignant
    end
    
    % Increment row by 1
    row = row + 1;
end
end