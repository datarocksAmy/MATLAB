% Train and Test TDNN 
function[foldThreeNet, y3,foldThreeT_Test ] = foldRun(net, XZ_Data)

% ---------------------- Fold 1 ----------------------
% Round 1 + Round 2 x,z Value & Labels -- Train
% Prep Train Series of data
foldOneTrainV = reshape((vertcat(XZ_Data(1,:), XZ_Data(3,:), XZ_Data(5,:), XZ_Data(7,:), ...
                                                               XZ_Data(13,:), XZ_Data(15,:), XZ_Data(17,:), XZ_Data(19,:), ...
                                                               XZ_Data(25,:), XZ_Data(27,:), XZ_Data(29,:), XZ_Data(31,:), ...
                                                               XZ_Data(37,:), XZ_Data(39,:), XZ_Data(41,:), XZ_Data(43,:)))', 1, []);
foldOneTrainT = reshape((vertcat(XZ_Data(2,:), XZ_Data(4,:), XZ_Data(6,:), XZ_Data(8,:), ...
                                                                 XZ_Data(14,:), XZ_Data(16,:), XZ_Data(18,:), XZ_Data(20,:),...
                                                                 XZ_Data(26,:), XZ_Data(28,:), XZ_Data(30,:), XZ_Data(32,:), ...
                                                                 XZ_Data(38,:), XZ_Data(40,:), XZ_Data(42,:), XZ_Data(44,:)))', 1, []);
                                                             
% Convert Into Sequential Value and Target
foldOneV = con2seq(foldOneTrainV);
foldOneT = con2seq(foldOneTrainT);

% Train the TDNN Net
[X1s,X1i,A1i,T1s] = preparets(net,foldOneV, foldOneT);
foldOneNet = train(net, X1s,T1s,X1i,A1i);

% Round 3 x, z Value & Labes -- Test
foldOneTestV = reshape((vertcat(XZ_Data(9,:), XZ_Data(11,:), ...
                                                               XZ_Data(21,:), XZ_Data(23,:), ...
                                                               XZ_Data(33,:), XZ_Data(35,:), ...
                                                              XZ_Data(45,:), XZ_Data(47,:)))', 1, []);
foldOneTestT = reshape((vertcat(XZ_Data(10,:), XZ_Data(12,:), XZ_Data(22,:), XZ_Data(24,:), ...
                                                                 XZ_Data(34,:), XZ_Data(36,:), XZ_Data(46,:), XZ_Data(48,:)))', 1, []);
% Convert Into Sequential Value and Target
foldOneV_Test = con2seq(foldOneTestV);
foldOneT_Test = con2seq(foldOneTestT);

% Test the mode                                                             
foldOneNet_predT = sim(foldOneNet, foldOneV_Test);
%plotresponse(foldOneT_Test,foldOneNet_predT);
[Y1,X1,A1] = net(X1s,X1i,A1i);
% ---------------------- Fold 2 ----------------------
% Concat Round 2 + Round 3 x,z value & labels
foldTwoTrainV = reshape((vertcat(XZ_Data(9,:), XZ_Data(11,:), XZ_Data(5,:), XZ_Data(7,:), ...
                                                               XZ_Data(21,:), XZ_Data(23,:), XZ_Data(17,:), XZ_Data(19,:), ...
                                                               XZ_Data(33,:), XZ_Data(35,:), XZ_Data(29,:), XZ_Data(31,:), ...
                                                               XZ_Data(45,:), XZ_Data(47,:), XZ_Data(41,:), XZ_Data(43,:)))', 1, []);
foldTwoTrainT = reshape((vertcat(XZ_Data(10,:), XZ_Data(12,:), XZ_Data(6,:), XZ_Data(8,:), ...
                                                                 XZ_Data(22,:), XZ_Data(24,:), XZ_Data(18,:), XZ_Data(20,:),...
                                                                 XZ_Data(34,:), XZ_Data(36,:), XZ_Data(30,:), XZ_Data(32,:), ...
                                                                 XZ_Data(46,:), XZ_Data(48,:), XZ_Data(42,:), XZ_Data(44,:)))', 1, []);
                                                             
% Convert Into Sequential Value and Target
foldTwoV = con2seq(foldTwoTrainV);
foldTwoT = con2seq(foldTwoTrainT);

% Train the TDNN Net
[X2s,X2i,A2i,T2s] = preparets(net,foldTwoV, foldTwoT);
foldTwoNet = train(net, X2s,T2s,X2i,A2i);

% Round 1 x, z Value & Labes -- Test
foldTwoTestV = reshape((vertcat(XZ_Data(1,:), XZ_Data(3,:), ...
                                                               XZ_Data(13,:), XZ_Data(15,:), ...
                                                               XZ_Data(25,:), XZ_Data(27,:), ...
                                                              XZ_Data(37,:), XZ_Data(39,:)))', 1, []);
foldTwoTestT = reshape((vertcat(XZ_Data(2,:), XZ_Data(4,:), XZ_Data(14,:), XZ_Data(16,:), ...
                                                                 XZ_Data(26,:), XZ_Data(28,:), XZ_Data(38,:), XZ_Data(40,:)))', 1, []);
% Convert Into Sequential Value and Target
foldTwoV_Test = con2seq(foldTwoTestV);
foldTwoT_Test = con2seq(foldTwoTestT);

% Test the mode                                                             
%foldTwoNet_predT = sim(foldTwoNet, foldTwoV_Test);
%plotresponse(foldTwoT_Test,foldTwoNet_predT);
[Y2,X2f,A2f] = net(X2s,X2i,A2i);
                                                             
% ---------------------- Fold 3 ----------------------
% Concat Round 1 + Round 3 x,z value & labels
foldThreeTrainV = reshape((vertcat(XZ_Data(1,:), XZ_Data(3,:), XZ_Data(9,:), XZ_Data(11,:), ...
                                                               XZ_Data(13,:), XZ_Data(15,:), XZ_Data(21,:), XZ_Data(23,:), ...
                                                               XZ_Data(25,:), XZ_Data(27,:), XZ_Data(33,:), XZ_Data(35,:), ...
                                                               XZ_Data(37,:), XZ_Data(39,:), XZ_Data(45,:), XZ_Data(47,:)))', 1, []);
foldThreeTrainT = reshape((vertcat(XZ_Data(2,:), XZ_Data(4,:), XZ_Data(10,:), XZ_Data(12,:), ...
                                                                 XZ_Data(14,:), XZ_Data(16,:), XZ_Data(22,:), XZ_Data(24,:),...
                                                                 XZ_Data(26,:), XZ_Data(28,:), XZ_Data(34,:), XZ_Data(36,:), ...
                                                                 XZ_Data(38,:), XZ_Data(40,:), XZ_Data(46,:), XZ_Data(48,:)))', 1, []);
                                                             
% Convert Into Sequential Value and Target
foldThreeV = con2seq(foldThreeTrainV);
foldThreeT = con2seq(foldThreeTrainT);

% Train the TDNN Net
[X3s,X3i,A3i,T3s] = preparets(net,foldThreeV, foldThreeT);
foldThreeNet = train(net, X3s,T3s,X3i,A3i);

% Round 2 x, z Value & Labes -- Test
foldThreeTestV = reshape((vertcat(XZ_Data(5,:), XZ_Data(7,:), ...
                                                               XZ_Data(17,:), XZ_Data(19,:), ...
                                                               XZ_Data(29,:), XZ_Data(31,:), ...
                                                              XZ_Data(41,:), XZ_Data(43,:)))', 1, []);
foldThreeTestT = reshape((vertcat(XZ_Data(6,:), XZ_Data(8,:), XZ_Data(18,:), XZ_Data(20,:), ...
                                                                 XZ_Data(30,:), XZ_Data(32,:), XZ_Data(42,:), XZ_Data(44,:)))', 1, []);
% Convert Into Sequential Value and Target
foldThreeV_Test = con2seq(foldThreeTestV);
foldThreeT_Test = con2seq(foldThreeTestT);

% Test the mode                                                             
%foldThreeNet_predT = sim(foldThreeNet, foldThreeV_Test);
[Y3,X3f,A3f] = net(X3s,X3i,A3i);
%plotresponse(foldThreeT_Test,foldThreeNet_predT);
                                                             

end