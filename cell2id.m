function Yid = cell2id(Ycell,Ccell)
    Yid = zeros(size(Ycell,1),1);
    for i = 1:size(Ycell,1)
        for id = 1:size(Ccell,1)
            if strcmp(Ycell(i),Ccell(id)), Yid(i) = id; end
        end
    end
end
