function [estimated_label,nearest_train_instances,nearest_train_labels] = classifier_knn(train_instances,train_labels,test_instance,k)
%k-Nearest Neighbors (kNN)
%
%Author: David Ferreira - Federal University of Amazonas
%
%classifier_knn
%
%Syntax
%1. estimated_label = classifier_knn(train_instances,train_labels,test_instance,k)
%2. [estimated_label,nearest_train_instances] = classifier_knn(train_instances,train_labels,test_instance,k)
%3. [estimated_label,nearest_train_instances,nearest_train_labels] = classifier_knn(train_instances,train_labels,test_instance,k)
%
%Description 
%1. Returns the estimated label of one test instances.
%2. Returns the estimated label of one test instance and the k nearest training instances.
%3. Returns the estimated label of one test instance, the k nearest training instances and the k nearest training labels.
%
%train_instances is an M-by-N matrix, with M instances of N features. 
%train_labels is an M-by-1 matrix, with respective M labels to each training instance. 
%test_instance is an 1-by-N matrix, with one instance of N features to be classified.
%k is a scalar, with the number of nearest neighbors selected.
%
%Examples
%1.
%     train_instances = [8 5; 3 7; 3 6; 7 3]; 
%     %train_labels = ["fruit"; "vegetable"; "protein"; "fruit"]; 
%     train_labels = [1; 2; 3; 1]; 
%     test_instance = [6 4]; 
%     k = 3;
%     estimated_label = classifier_knn(train_instances,train_labels,test_instance,k)
%     estimated_label = 
%               1
%
%2.
%     [estimated_label,nearest_train_instances] = classifier_knn(train_instances,train_labels,test_instance,k)
%     estimated_label = 
%               1
%     nearest_train_instances = 
%               7 3
%               8 5
%               3 6
%
%3.
%     [estimated_label,nearest_train_instances,nearest_train_labels] = classifier_knn(train_instances,train_labels,test_instance,k)
%     estimated_label = 
%               1
%     nearest_train_instances = 
%               7 3
%               8 5
%               3 6
%     nearest_train_labels =
%               1
%               1
%               3
    
% Euclidean distance between two points
A = repmat(test_instance,size(train_instances,1),1)-train_instances;
distances = sqrt(sum(A.*A,2));
% Sort the distances in ascending order and check the k nearest training labels
[~,I] = sort(distances);
nearest_train_labels = train_labels(I(1:k));
% Frequencies of the k nearest training labels
N = histc(nearest_train_labels,1:max(nearest_train_labels));
frequencies = N(nearest_train_labels);
% Nearest training label with maximum frequency (if duplicated, check the nearest training instance)
[~,J] = max(frequencies);
estimated_label = nearest_train_labels(J);

% Check the number of output arguments
if nargout > 1
    nearest_train_instances = train_instances(I(1:k),:);
end
end