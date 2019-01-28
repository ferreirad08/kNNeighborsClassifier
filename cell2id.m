function Yid = cell2id(Ynew,C)
    Yid = zeros(size(Ynew,1),1);
    for i = 1:size(Ynew,1)
        for id = 1:size(C,1)
            if strcmp(Ynew(i),C(id)), Yid(i) = id; end
        end
    end
end
