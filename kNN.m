function Ypred = kNNeighbors(X,Y,Xnew,k)
%k-Nearest Neighbors (kNN)
%
% David Alan de Oliveira Ferreira (http://lattes.cnpq.br/3863655668683045)
% D.Sc. student in Electrical Engineering from the Federal University of
% Amazonas 
% e-mail: ferreirad08@gmail.com

[C,~,Y] = unique(Y); % Numeric labels
distances = pdist2(X,Xnew); % Distance between two vectors
[distances,indices] = sort(distances); % Ordered distances
Ynearest = Y(indices(1:k,:)); % k nearest labels
Ypred = C(mode(Ynearest)); % Most frequent label
end
