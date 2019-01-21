# k-Nearest Neighbors (kNN) - MATLAB R2017b
classifier_knn

Syntax 
1. estimated_labels = classifier_knn(train_instances,train_labels,test_instances,k) 
2. [estimated_labels,accuracy] = classifier_knn(train_instances,train_labels,test_instances,k,test_labels) 
3. [estimated_label,~,nearest_train_instances] = classifier_knn(train_instances,train_labels,test_instance,k) 
4. [estimated_label,~,nearest_train_instances,nearest_train_labels] = classifier_knn(train_instances,train_labels,test_instance,k)

Description 
1. Returns the estimated labels of one or multiple test instances. 
2. Returns the estimated labels of one or multiple test instances and the accuracy of the estimates. 
3. Returns the estimated label of one test instance and the k nearest training instances. 
4. Returns the estimated label of one test instance, the k nearest training instances and the k nearest training labels.

train_instances is an M-by-N matrix, with M instances of N features. 
train_labels is an M-by-1 matrix, with respective M labels to each training instance. 
test_instances is an P-by-N matrix, with P instances of N features to be classified. 
test_instance is an 1-by-N matrix, with one instance of N features to be classified. 
k is a scalar, with the number of nearest neighbors selected. 
test_labels is an P-by-1 matrix, with respective P labels to each test instance (Used to check the accuracy between 0 and 100%).

Examples

1. 
train_instances = [8 5; 3 7; 3 6; 7 3]; 
%train_labels = ["fruit"; "vegetable"; "protein"; "fruit"]; 
train_labels = [1; 2; 3; 1]; 
test_instances = [6 4; 6 4; 6 4]; 
k = 4; 
estimated_labels = classifier_knn(train_instances,train_labels,test_instances,k) 
estimated_labels = 
1 
1 
1

2. 
test_labels = [1; 1; 2]; 
[estimated_labels,accuracy] = classifier_knn(train_instances,train_labels,test_instances,k,test_labels) 
estimated_labels = 
1 
1 
1 
accuracy = 
66.6667

3. 
test_instance = [6 4]; 
[estimated_label,~,nearest_train_instances] = classifier_knn(train_instances,train_labels,test_instance,k) 
estimated_label = 
1 
nearest_train_instances = 
7 3 
8 5 
3 6 
3 7

4. 
[estimated_label,~,nearest_train_instances,nearest_train_labels] = classifier_knn(train_instances,train_labels,test_instance,k) 
estimated_label = 
1 
nearest_train_instances = 
7 3 
8 5 
3 6 
3 7 
nearest_train_labels = 
1 
1 
3
2
