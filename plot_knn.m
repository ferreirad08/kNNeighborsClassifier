function plot_knn(train_instances,test_instance,k)
%k-Nearest Neighbors (kNN) Plot 2-D
%
%Author: David Ferreira - Federal University of Amazonas
%
%plot_knn
%
%Syntax
%plot_knn(train_instances,test_instance,k)
%
%Description 
%Creates a chart circulating the nearest training instances.
%
%train_instances is an M-by-N matrix, with M instances of N features. 
%test_instance is an 1-by-N matrix, with one instance of N features to be classified.
%k is a scalar, with the number of nearest neighbors selected.
%
%Example
%train_instances = [8 5; 3 7; 3 6; 7 3];
%test_instance = [6 4];
%k = 3;
%plot_knn(train_instances,test_instance,k)

% Euclidean distance between two points
A = repmat(test_instance,size(train_instances,1),1)-train_instances;
distances = sqrt(sum(A.^2,2));
% Sort the distances in ascending order
distances = sort(distances);

feature1 = train_instances(:,1);
feature2 = train_instances(:,2);

xc = test_instance(1);
yc = test_instance(2);
r = distances(k);

theta = linspace(0,2*pi);
x = r*cos(theta) + xc;
y = r*sin(theta) + yc;
plot(x,y,xc,yc,'o',feature1,feature2,'s')
axis equal
end
