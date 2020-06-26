function [Ypred,indices,distances] = kNN(X,Y,Xnew,k,p)
[C,~,Y] = unique(Y);

% Distance between two points
distances = dsb_utilities.cdist(Xnew,X,p);
% Sort the distances in ascending order and check the k nearest training labels
[distances,indices] = sort(distances,2);
distances = distances(:,1:k);
indices = indices(:,1:k);

Ynearest = Y(indices)';
% Frequencies of the k nearest training labels
N = histc(Ynearest,1:max(Y));
[n_class,P] = size(N);
frequencies = N(Ynearest + repmat(0:n_class:P*n_class-n_class,k,1));
% Nearest training label with maximum frequency (if duplicated, check the nearest training instance)
[~,J] = max(frequencies);
Ypred = Ynearest(J+(0:k:P*k-k));

Ypred = C(Ypred);
end
