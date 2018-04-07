% Generate labels for Geunuine and Impostor
function[label] = label_GI(GenuineScore)

% Get the size of col and row for matrix
col = size(GenuineScore, 2);
row = size(GenuineScore, 1);

% Initialize label matrix as 0
label = zeros(row*40, col*40);

% Replace the label with 1 when it's the right class
for face = 1:40
    label(50*(face-1) +1:50*face, 50*(face-1) +1:50*face) = 1;
end


end
  