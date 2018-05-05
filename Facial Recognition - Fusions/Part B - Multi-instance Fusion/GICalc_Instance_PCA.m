% Calculate Genuine and Impostor for PCA
function [ GI ] = GICalc_Instance_PCA(featureMatrixAgg, testProjectAgg)

% Initialize 
GI = [];


% Loop through all 40 classes
for person = 1:40
    tempGenuine = [];
    tempImpostor = [];
    starttempImpostor = [];
    endtempImpostor = [];
    startImpostor = [];
    endImpostor = [];
    
    % Calculate Genuine and Impostor Scores and take average of each images 
    for imgCount = 1:5
        GenuineScore = pdist2(featureMatrixAgg(1:10,10*(imgCount-1)+1:10*imgCount, person), testProjectAgg(1:10,10*(imgCount-1)+1:10*imgCount, person));
        tempGenuine = [tempGenuine, mean(mean(GenuineScore))];
    end
    
    % Calculate Genuine and Impostor Scores
    % Stack up person 1
    if person == 1
        GI = [GI, mean(tempGenuine)];     
        for person2 = 2:40
           for mainImg = 1:5
                for imgCount2 = 1:5
                    ImpostorScore = pdist2(featureMatrixAgg(1:10,10*(imgCount2-1)+1:10*imgCount2, person2), testProjectAgg(1:10,10*(mainImg-1)+1:10*mainImg, person));
                    tempImpostor = [tempImpostor, mean(mean(ImpostorScore))];
                end
            end
                GI = [GI, mean(tempImpostor)];
        end

    else
     % Do the same for Person 2 to 40    
         for iface = 1 : (person-1)
             for mainImgL = 1:5
                for imgCount_start = 1:5
                    ImpostorScore = pdist2(testProjectAgg(1:10,10*(imgCount_start-1)+1:10*imgCount_start, iface), testProjectAgg(1:10,10*(mainImgL-1)+1:10*mainImgL, person));
                    starttempImpostor = [starttempImpostor, mean(mean(ImpostorScore))];
                end
             end
         startImpostor = [startImpostor, mean(starttempImpostor)];
         end
         for iface2 = (person+1):40
             for mainImgL2 = 1:5
              for imgCount_end = 1:5
                    ImpostorScore = pdist2(testProjectAgg(1:10,10*(imgCount_end-1)+1:10*imgCount_end, iface2), testProjectAgg(1:10,10*(mainImgL2-1)+1:10*mainImgL2, person));
                    endtempImpostor = [endtempImpostor, mean(mean(ImpostorScore))];
              end
             end
         endImpostor = [endImpostor, mean(endtempImpostor)];
         end
         stack = [startImpostor, mean(tempGenuine), endImpostor];
         GI = [GI; stack];
    end
end

end
