% Downsize to 4x4 for Confusion Matrix for 6CV

function[confusionResize] = slashConfusion(predictTest)
% Confusion Matrix with Correct Classifications
originalConfusion = [ [1, -1, -1, -1]; [-1, 1, -1, -1]; [-1, -1, 1, -1]; [-1, -1, -1, 1];];

% Downsize 300 predicted values to 1 for all 4 movements
circle_downsize = [ mean(predictTest(1, 1:300)), mean(predictTest(1, 301:600)), mean(predictTest(1, 601:900)), mean(predictTest(1, 901:1200)), ...
    mean(predictTest(1, 1201:1500)), mean(predictTest(1, 1501:1800)), mean(predictTest(1, 1801:2100)), mean(predictTest(1, 2101:2400)), ...
    mean(predictTest(1, 2401:2700)), mean(predictTest(1, 2701:3000)), mean(predictTest(1, 3001:3300)), mean(predictTest(1, 3301:3600)) ];

triangle_downsize = [ mean(predictTest(2, 1:300)), mean(predictTest(2, 301:600)), mean(predictTest(2, 601:900)), mean(predictTest(2, 901:1200)), ...
    mean(predictTest(2, 1201:1500)), mean(predictTest(2, 1501:1800)), mean(predictTest(2, 1801:2100)), mean(predictTest(2, 2101:2400)), ...
    mean(predictTest(2, 2401:2700)), mean(predictTest(2, 2701:3000)), mean(predictTest(2, 3001:3300)), mean(predictTest(2, 3301:3600))  ];

right_downsize = [ mean(predictTest(3, 1:300)), mean(predictTest(3, 301:600)), mean(predictTest(3, 601:900)), mean(predictTest(3, 901:1200)), ...
    mean(predictTest(3, 1201:1500)), mean(predictTest(3, 1501:1800)), mean(predictTest(3, 1801:2100)), mean(predictTest(3, 2101:2400)), ...
    mean(predictTest(3, 2401:2700)), mean(predictTest(3, 2701:3000)), mean(predictTest(3, 3001:3300)), mean(predictTest(3, 3301:3600))  ];

down_downsize = [ mean(predictTest(4, 1:300)), mean(predictTest(4, 301:600)), mean(predictTest(4, 601:900)), mean(predictTest(4, 901:1200)), ...
    mean(predictTest(4, 1201:1500)), mean(predictTest(4, 1501:1800)), mean(predictTest(4, 1801:2100)), mean(predictTest(4, 2101:2400)), ...
    mean(predictTest(4, 2401:2700)), mean(predictTest(4, 2701:3000)), mean(predictTest(4, 3001:3300)), mean(predictTest(4, 3301:3600)) ];

% Downsize again to go from 4x12 to 4x4
circle_resize2 = [mean([circle_downsize(1,1), circle_downsize(1,5), circle_downsize(1,9)]), mean([circle_downsize(1,2), circle_downsize(1,6), circle_downsize(1,10)]), ...
    mean([circle_downsize(1,3), circle_downsize(1,7), circle_downsize(1,11)]), mean([circle_downsize(1,4), circle_downsize(1,8), circle_downsize(1,12)])];

triangle_resize2 = [mean([triangle_downsize(1,1), triangle_downsize(1,5), triangle_downsize(1,9)]), mean([triangle_downsize(1,2), triangle_downsize(1,6), triangle_downsize(1,10)]), ...
    mean([triangle_downsize(1,3), triangle_downsize(1,7), triangle_downsize(1,11)]), mean([triangle_downsize(1,4), triangle_downsize(1,8), triangle_downsize(1,12)])];

right_resize2 = [mean([right_downsize(1,1), right_downsize(1,5), right_downsize(1,9)]), mean([right_downsize(1,2), right_downsize(1,6), right_downsize(1,10)]), ...
    mean([right_downsize(1,3), right_downsize(1,7), right_downsize(1,11)]), mean([right_downsize(1,4), right_downsize(1,8), right_downsize(1,12)])];

down_resize2 = [mean([down_downsize(1,1), down_downsize(1,5), down_downsize(1,9)]), mean([down_downsize(1,2), down_downsize(1,6), down_downsize(1,10)]), ...
    mean([down_downsize(1,3), down_downsize(1,7), down_downsize(1,11)]), mean([down_downsize(1,4), down_downsize(1,8), down_downsize(1,12)])];

% A 4x4 Confusion Matrix with predicted values!
confusionResize = [ circle_resize2; triangle_resize2; right_resize2; down_resize2 ];

end