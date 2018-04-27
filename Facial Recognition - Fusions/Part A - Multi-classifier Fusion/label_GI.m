% Generate labels for Geunuine and Impostor
function[label] = label_GI()

% Initialize label matrix as 1
label = ones(400, 400);


% Replace the label with 0 when it's the right class
for face = 1:40
    label(10*(face-1) +1:10*face, 10*(face-1) +1:10*face) = 0;
end


end
  