% ----------------------------------------------------------------------------------------------------
% Mode 1 : 1-5 Images as Training and 6-10 Images as Testing
% ---------------------------------------------------------------------------------------------------
clc
clear all
close all

 % Calculate Genuine Scores
  [GenuineVec, featureMatrixAgg, testProjectAgg] = GenuineCalc;
 
 % Calculate Impostor Scores
 [ImpostorVec] = ImpostorCalc(featureMatrixAgg, testProjectAgg);
 
 % Genuine + Impostor
  GI = [GenuineVec, ImpostorVec];
   
 
 % Labels for data
 Labels = zeros(400,400);
 for rowCount = 0:10:390 
    Labels(rowCount+1:rowCount + 10, rowCount+1:rowCount + 10) = ones(10, 10);
 end
 
 % Convert GI to 0 or 1 : Cut off Point 0.7
 GI_convert = zeros(400, 400);
 
 for row = 1:400
     for col = 1:400
         if GI(row,col) < 0.7
             GI_convert(row, col) = 1;
         end
      
     end
 end
 testLabels = [ones(1, 10), zeros(1, 390)]';
 
 % FPR, FNR
[fpr, fnr] = ezroc3(GI, testLabels, 2, 0, 0);


