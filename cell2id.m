function [Y,C] = cell2id(Y,C)
    Ycell = Y;
    Y = zeros(size(Ycell,1),1);
    if nargin < 2, C = unique(Ycell); end
    for i = 1:size(Ycell,1)
        for id = 1:size(C,1)
            if strcmp(Ycell(i),C(id)), Y(i) = id; end
        end
    end
end
