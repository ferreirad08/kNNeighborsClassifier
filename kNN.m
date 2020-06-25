function [Ypred,I] = kNN(X,Y,Xnew,k)
[C,~,Y] = unique(Y);

% Euclidean distance between two points
distances = pdist2(X,Xnew);
% Sort the distances in ascending order and check the k nearest training labels
[~,I] = sort(distances);
I = I(1:k,:);
Ynearest = Y(I);
% Frequencies of the k nearest training labels
N = histc(Ynearest,1:max(Y));
[m,P] = size(N);
frequencies = N(Ynearest+repmat(0:m:P*m-m,k,1));
% Nearest training label with maximum frequency (if duplicated, check the nearest training instance)
[~,J] = max(frequencies);
Ypred = Ynearest(J+(0:k:P*k-k));

Ypred = C(Ypred);
I = I';
end
