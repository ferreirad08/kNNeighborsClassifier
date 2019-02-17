function [Xnearest,Ynearest,distances] = find_knn(X,Y,Xnew,k)
%k-Nearest Neighbors (kNN)
%
%Author: David Ferreira - Federal University of Amazonas
%Contact: ferreirad08@gmail.com
%
%find_knn
%
%Syntax
%1. Xnearest = find_knn(X,Y,Xnew,k)
%2. [Xnearest,Ynearest,distances] = find_knn(X,Y,Xnew,k)
%
%Description 
%1. Returns the k nearest training instances.
%2. Returns the k nearest training instances, the k nearest training labels and the respective distances.
%
%X is an M-by-N matrix, with M instances of N features. 
%Y is an M-by-1 matrix, with respective M labels to each training instance. 
%Xnew is an 1-by-N matrix, with one instance of N features to be classified.
%k is a scalar, with the number of nearest neighbors selected.
%
%Examples
%1.
%     X = [8 5 1; 3 7 2; 3 6 3; 7 3 1]; 
%     Y = {'fruit';'vegetable';'protein';'fruit'}; 
%     Xnew = [6 4 1];
%     k = 3;
%     Xnearest = find_knn(X,Y,Xnew,k)
%     Xnearest = 
%         7 3 1
%         8 5 1
%         3 6 3
%
%2.
%     [Xnearest,Ynearest,distances] = find_knn(X,Y,Xnew,k)
%     Xnearest = 
%         7 3 1
%         8 5 1
%         3 6 3
%     Ynearest =
%         'fruit'
%         'fruit'
%         'protein'
%     distances = 
%         1.4142
%         2.2361
%         4.1231
%

[C,~,Y] = unique(Y,'stable');

% Euclidean distance between two points
A = repmat(Xnew,size(X,1),1)-X;
distances = sqrt(sum(A.^2,2));
% Sort the distances in ascending order and check the k nearest training instances
[~,I] = sort(distances);
Xnearest = X(I(1:k),:);

% Check the number of output arguments
if nargout > 1, Ynearest = C(Y(I(1:k))); end
if nargout > 2, distances = distances(I(1:k)); end
end