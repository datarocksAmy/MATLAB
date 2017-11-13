% -------------------------------------------------------------------
% Mini Project #3 - Gesture Recognition : Time Delay Nerual Network
% 
% -------------------------------------------------------------------

% Clear memory data
clc
clear 
close all

% Convert 3 Rounds of x, z data into two matrices using function 'Encapsulate' :
% Matrix #1 - Slice x, z data for all 3 rounds into 8 columns for all 4 movements
% Matrix #2 - Transform x, z of all 3 rounds into 2 columns per movements
% All matrices come with labels for x and z
[P1_XZ_data, P1_catXZ_data] = Encapsulate('GestureData\Person1.xls');
[P2_XZ_data, P2_catXZ_data] = Encapsulate('GestureData\Person2.xls');
[P3_XZ_data, P3_catXZ_data] = Encapsulate('GestureData\Person3.xls');
[P4_XZ_data, P4_catXZ_data] = Encapsulate('GestureData\Person4.xls');
[P5_XZ_data, P5_catXZ_data] = Encapsulate('GestureData\Person5.xls');
[P6_XZ_data, P6_catXZ_data] = Encapsulate('GestureData\Person6.xls');

% 1-D Time Delay Nerual Network ( 1 Hidden Layer )
TDNNnet = timedelaynet(0:15, 1, 'trainbr');
TDNNnet.divideFcn = '';
[foldThreeNet, y3,foldThreeT_Test] = foldRun(TDNNnet, P1_XZ_data);
%view(foldOneNet);
%view(foldTwoNet);
view(foldThreeNet);
