function [Y,C] = id(Y,C)
    Ycell = Y;
    Y = zeros(size(Ycell,1),1);
    if nargin < 2, C = unique(Ycell); end
    for i = 1:size(Ycell,1)
        for j = 1:size(C,1)
            if strcmp(Ycell(i),C(j)), Y(i) = j; end
        end
    end
end
