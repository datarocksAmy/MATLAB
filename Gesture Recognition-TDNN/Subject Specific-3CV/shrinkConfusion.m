% Downsize to 4x4 for Confusion Matrix

function[confusionResize] = shrinkConfusion(predictTest)
% Confusion Matrix with Correct Classifications
originalConfusion = [ [1, -1, -1, -1]; [-1, 1, -1, -1]; [-1, -1, 1, -1]; [-1, -1, -1, 1];];

% Downsize 300 predicted values to 1 for all 4 movements
circle_downsize = [ mean(predictTest(1, 1:300)), mean(predictTest(1, 301:600)), mean(predictTest(1, 601:900)), mean(predictTest(1, 901:1200)) ];
triangle_downsize = [ mean(predictTest(2, 1:300)), mean(predictTest(2, 301:600)), mean(predictTest(2, 601:900)), mean(predictTest(2, 901:1200))  ];
right_downsize = [ mean(predictTest(3, 1:300)), mean(predictTest(3, 301:600)), mean(predictTest(3, 601:900)), mean(predictTest(3, 901:1200))  ];
down_downsize = [ mean(predictTest(4, 1:300)), mean(predictTest(4, 301:600)), mean(predictTest(4, 601:900)), mean(predictTest(4, 901:1200)) ];

% A 4x4 Confusion Matrix with predicted values!
confusionResize = [ circle_downsize; triangle_downsize; right_downsize; down_downsize ];

end