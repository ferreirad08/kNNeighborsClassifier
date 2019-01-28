function Yid = cell2id(Ynew,C)    
     Yid = zeros(size(Ynew,1),1);
     for i = 1:numel(C);
         I = find(strcmp(Ynew,C(i)));
         Yid(I) = i;
     end
end
