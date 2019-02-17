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
%     load fisheriris
%     X = meas;
%     Y = species;
%     Xnew = [min(meas);mean(meas);max(meas)];
%     k = 5;
%     label = predict_knn(X,Y,Xnew,k)
%     label = 
%         'setosa'
%         'versicolor'
%         'virginica'
%
%2.
%     Ynew = {'versicolor';'versicolor';'virginica'};
%     [label,accuracy] = predict_knn(X,Y,Xnew,k,Ynew)
%     label = 
%         'setosa'
%         'versicolor'
%         'virginica'
%     accuracy =
%         0.6667

[C,~,Y] = unique(Y,'stable');

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
    [~,Ynew] = ismember(Ynew,C);
    accuracy = sum(label==Ynew)/P;
end

label = C(label);
end
