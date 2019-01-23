function [estimated_labels,accuracy] = accuracy_knn(train_instances,train_labels,test_instances,k,test_labels)
%k-Nearest Neighbors (kNN) Accuracy
%
%Author: David Ferreira - Federal University of Amazonas
%
%accuracy_knn
%
%Syntax
%1. estimated_labels = accuracy_knn(train_instances,train_labels,test_instances,k)
%2. [estimated_labels,accuracy] = accuracy_knn(train_instances,train_labels,test_instances,k,test_labels)
%
%Description 
%1. Returns the estimated labels of one or multiple test instances.
%2. Returns the estimated labels of one or multiple test instances and the accuracy of the estimates.
%
%train_instances is an M-by-N matrix, with M instances of N features. 
%train_labels is an M-by-1 matrix, with respective M labels to each training instance. 
%test_instances is an P-by-N matrix, with P instances of N features to be classified.
%k is a scalar, with the number of nearest neighbors selected.
%test_labels is an P-by-1 matrix, with respective P labels to each test instance (Used to check the accuracy between 0 and 1).
%
%Examples
%1.
%     train_instances = [8 5; 3 7; 3 6; 7 3];
%     %train_labels = ["fruit"; "vegetable"; "protein"; "fruit"];
%     train_labels = [1; 2; 3; 1];
%     test_instances = [6 4; 6 4; 6 4; 6 4; 6 4];
%     k = 3;
%     estimated_labels = accuracy_knn(train_instances,train_labels,test_instances,k)
%     estimated_labels = 
%               1
%               1
%               1
%               1
%               1
%
%2.
%     test_labels = [1; 1; 1; 2; 2];
%     [estimated_labels,accuracy] = accuracy_knn(train_instances,train_labels,test_instances,k,test_labels)
%     estimated_labels =
%               1
%               1
%               1
%               1
%               1
%     accuracy =
%               0.6000

P = size(test_instances,1);
estimated_labels = zeros(P,1);
for i = 1:P
    % k-Nearest Neighbors (kNN)
    estimated_labels(i) = classifier_knn(train_instances,train_labels,test_instances(i,:),k);
end

% Check the number of output arguments
if nargout > 1
    accuracy = sum(estimated_labels == test_labels)/P;
end
end
