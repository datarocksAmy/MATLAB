% Calculate Genuine and Impostor Scores for each person
function[GI] = GICalc_Instance_LDA(trainImgD, testImgD, eigenVec)

% Initialize to store Genuine and Impostor
GI = [];

% Loop through all 40 people
for face = 1:40
    startImpostor = [];
    endImpostor = [];
    % Calculate Genuine Scores
    G_score = pdist2((trainImgD(:, :, face)*eigenVec)', (testImgD(:, :, face)*eigenVec)', 'euclidean');
        
    % Person 1
    if face == 1
        GI= [GI, mean(mean(G_score))];
        for ifaceOne = 2:40
            iscore = pdist2((trainImgD(:, :, face)*eigenVec)', (testImgD(:, :, ifaceOne)*eigenVec)', 'euclidean');
            GI = [GI, mean(mean(iscore))];
        end
        
    % Person 2 - 40
    else
        % Calculate the first part of the Impostor
        for iface = 1 : (face-1)
            start_iscore = pdist2((trainImgD(:, :, face)*eigenVec)', (testImgD(:, :, iface)*eigenVec)', 'euclidean');
            startImpostor = [startImpostor, mean(mean(start_iscore))];
        end
        
        % Calculate the second part of the Impostor
        for iface2 = (face+1):40
            end_iscore = pdist2((trainImgD(:, :, face)*eigenVec)', (testImgD(:, :, iface2)*eigenVec)', 'euclidean');
            endImpostor = [endImpostor, mean(mean(end_iscore))];
        end
        smashTogether = [startImpostor, mean(mean(G_score)), endImpostor];
        GI = [GI; smashTogether];
    end
   
end


end
