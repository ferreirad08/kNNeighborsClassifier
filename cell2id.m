function [Yid,Ccell] = cell2id(Ycell,Ccell)
    Yid = zeros(size(Ycell,1),1);
    if nargin < 2, Ccell = unique(Ycell); end
    for i = 1:size(Ycell,1)
        for id = 1:size(Ccell,1)
            if strcmp(Ycell(i),Ccell(id)), Yid(i) = id; end
        end
    end
end
