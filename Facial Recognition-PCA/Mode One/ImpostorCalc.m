% Calculate Impostor Scores from feature matrix and projected value
function[ImpostorVec] = ImpostorCalc(featureMatrixAgg, testProjectAgg)

% Initialize vector
ImpostorVec = [];

% Loop through feature matrices
for FM_idx = 1 : size(featureMatrixAgg, 3)
    PersonImpostor = [];
    % Loop through projected matrices to calculate scores
    for TP_idx = 1 : size(testProjectAgg, 3)
        
          % If not itself, do the math!
         if FM_idx ~= TP_idx 

            % Calc Euclidean Distance for impostor scores
            impostorScore = pdist2(featureMatrixAgg(:,:, TP_idx), testProjectAgg(:,:, FM_idx), 'euclidean');
            PersonImpostor = [PersonImpostor, impostorScore];
         end
    end
    
    % Store Impostsor Scores
    % Can't vertcat an empty vector with another value vector
    % So store the first Impostor directly in the Impostor
    if isempty(ImpostorVec) == 1
        ImpostorVec = PersonImpostor;
    
    % Any Impostors after 1st one are vertcat into the matrix
    else
        ImpostorVec = vertcat(ImpostorVec, PersonImpostor);
        %ImpostorVec = [ImpostorVec; PersonImpostor];
    end
    
end


end