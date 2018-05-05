% Generate labels for Geunuine and Impostor
function[label] = LDA_Instance_GILabel(GIsize)

% Initialize label matrix as 1
label = ones(GIsize, GIsize);

% Replace the label with 0 when it's the right class
for face = 1:40
    if GIsize == 400
        label(10*(face-1) +1:10*face, 10*(face-1) +1:10*face) = 0;
    else
        label(face, face) = 0;
end


end
  