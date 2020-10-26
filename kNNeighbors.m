function Ypred = kNNeighbors(X,Y,Xnew,k)
%k-Nearest Neighbors (kNN)
%
% Author: M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com
% Date: October 2020

[C,~,Y] = unique(Y); % Numeric labels
distances = pdist2(X,Xnew); % Euclidean distance matrix
[distances,indices] = sort(distances); % Ordered distances
Ynearest = Y(indices(1:k,:)); % k nearest labels
Ypred = C(mode(Ynearest)); % Most frequent label
end
