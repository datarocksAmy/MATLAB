% Create Label and transform GI vector to 0-1

function [testLabels, GI_convert]=Label_TransformGI(GI)

% Labels for data
 Labels = zeros(size(GI,1),size(GI,1));
 for rowCount = 0:10:size(GI,1)-10 
    Labels(rowCount+1:rowCount + 10, rowCount+1:rowCount + 10) = ones(10, 10);
 end
 
 % Convert GI to 0 or 1 : Cut off Point 0.9
 GI_convert = zeros(size(GI,1),size(GI,1));
 
 for row = 1:size(GI,1)
     for col = 1:size(GI,2)
         if GI(row,col) < 0.9
             GI_convert(row, col) = 1;
         end
      
     end
 end
 testLabels = [ones(1, 10), zeros(1, size(GI,1)-10 )]';

 end