function [Y,C] = cell2num(Y)
    Ycell = Y;
    Y = zeros(size(Ycell,1),1);
    C = unique(Ycell);
    for i = 1:size(Ycell,1)
        for j = 1:size(C,1)
            if strcmp(Ycell(i),C(j)), Y(i) = j; end
        end
    end
end