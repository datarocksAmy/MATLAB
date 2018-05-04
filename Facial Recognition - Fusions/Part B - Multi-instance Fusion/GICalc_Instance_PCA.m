% Calculate Genuine and Impostor for PCA
function [ GenuineVec, ImpostorVec ] = GICalc_Instance_PCA(featureMatrixAgg, testProjectAgg)

% Initialize 
GenuineVec = [];
ImpostorVec = [];

% Loop through all 40 classes
for person = 1:40
    tempGenuine = [];
    tempImpostor = [];
    
    % Calculate Genuine Score and take average of each images 
    for imgCount = 1:5
        GenuineScore = pdist2(featureMatrixAgg(1:10,10*(imgCount-1)+1:10*imgCount, person), testProjectAgg(1:10,10*(imgCount-1)+1:10*imgCount, person));
        tempGenuine = [tempGenuine, mean(mean(GenuineScore))];
        GenuineVec = [GenuineVec, mean(tempGenuine)];
        
        % Calculate Impostor Score and take average of images       
        for person2 = 1:40
            if person ~= person2
                for imgCount2 = 1:5
                    ImpostorScore = pdist2(featureMatrixAgg(1:10,10*(imgCount2-1)+1:10*imgCount2, person2), testProjectAgg(1:10,10*(imgCount-1)+1:10*imgCount, person));
                    tempImpostor = [tempImpostor, mean(mean(ImpostorScore))];
                    ImpostorVec = [ImpostorVec, mean(tempImpostor)];
                end
            end
        end
    end
end

end
