function plot_knn(train_instances,train_labels,test_instance,k)
%k-Nearest Neighbors (kNN) Plot 2-D
%
%Author: David Ferreira - Federal University of Amazonas
%
%plot_knn
%
%Syntax
%plot_knn(train_instances,train_labels,test_instance,k)
%
%Description 
%Creates a chart circulating the nearest training instances.
%
%train_instances is an M-by-N matrix, with M instances of N features.
%train_labels is an M-by-1 matrix, with respective M labels to each training instance.
%test_instance is an 1-by-N matrix, with one instance of N features to be classified.
%k is a scalar, with the number of nearest neighbors selected.
%
%Example
%train_instances = [8 5; 3 7; 3 6; 7 3];
%%train_labels = ["fruit"; "vegetable"; "protein"; "fruit"]; 
%train_labels = [1; 2; 3; 1];
%test_instance = [6 4];
%k = 3;
%plot_knn(train_instances,train_labels,test_instance,k)

% Euclidean distance between two points
A = repmat(test_instance,size(train_instances,1),1)-train_instances;
distances = sqrt(sum(A.^2,2));
% Sort the distances in ascending order
distances = sort(distances);

figure
hold on

r = distances(k);
xc = test_instance(1);
yc = test_instance(2);

theta = linspace(0,2*pi);
x = r*cos(theta) + xc;
y = r*sin(theta) + yc;
plot(x,y,xc,yc,'x')
axis equal

C = unique(train_labels);
for i = 1:size(C,1)
    L = find(train_labels==C(i));
    plot(train_instances(L,1),train_instances(L,2),'^')
end
end