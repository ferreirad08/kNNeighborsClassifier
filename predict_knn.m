function [label,accuracy] = predict_knn(X,Y,Xnew,k,Ynew)
%k-Nearest Neighbors (kNN)
%
%Author: David Ferreira - Federal University of Amazonas
%Contact: ferreirad08@gmail.com
%
%predict_knn
%
%Syntax
%1. label = predict_knn(X,Y,Xnew,k)
%2. [label,accuracy] = predict_knn(X,Y,Xnew,k,Ynew)
%
%Description 
%1. Returns the estimated labels of one or multiple test instances.
%2. Returns the estimated labels of one or multiple test instances and the accuracy of the estimates.
%
%X is an M-by-N matrix, with M instances of N features. 
%Y is an M-by-1 matrix, with respective M labels to each training instance. 
%Xnew is an P-by-N matrix, with P instances of N features to be classified.
%k is a scalar, with the number of nearest neighbors selected.
%Ynew is an P-by-1 matrix, with respective P labels to each test instance (Used to check the accuracy between 0 and 1).
%
%Examples
%1.
%     X = [8 5 1; 3 7 2; 3 6 3; 7 3 1];
%     Y = {'fruit';'vegetable';'protein';'fruit'};
%     Xnew = [6 4 1; 6 4 1; 6 4 1];
%     k = 3;
%     label = predict_knn(X,Y,Xnew,k)
%     label = 
%         'fruit'
%         'fruit'
%         'fruit'
%
%2.
%     Ynew = {'fruit';'fruit';'vegetable'};
%     [label,accuracy] = predict_knn(X,Y,Xnew,k,Ynew)
%     label = 
%         'fruit'
%         'fruit'
%         'fruit'
%     accuracy =
%         0.6667

tf = iscell(Y);
if tf, [C,~,Y] = unique(Y); end

P = size(Xnew,1);
label = zeros(P,1);
for i = 1:P
    % Euclidean distance between two points
    A = repmat(Xnew(i,:),size(X,1),1)-X;
    distances = sqrt(sum(A.^2,2));
    % Sort the distances in ascending order and check the k nearest training labels
    [~,I] = sort(distances);
    Ynearest = Y(I(1:k));
    % Frequencies of the k nearest training labels
    N = histc(Ynearest,1:max(Ynearest));
    frequencies = N(Ynearest);
    % Nearest training label with maximum frequency (if duplicated, check the nearest training instance)
    [~,J] = max(frequencies);
    label(i) = Ynearest(J);
end

% Check the number of input and output arguments
if nargin > 4 && nargout > 1
    if iscell(Ynew), Ynew = cell2id(Ynew,C); end
    accuracy = sum(label == Ynew)/P;
end

if tf, label = C(label); end
end

function Yid = cell2id(Ynew,C)    
Yid = zeros(size(Ynew,1),1);
for i = 1:numel(C);
    I = find(strcmp(Ynew,C(i)));
    Yid(I) = i;
end
end
