# k-Nearest Neighbors (kNN) - MATLAB

Function 
1. classifier_knn 
2. predict_knn

Description 
1. Returns the estimated label of one test instance, the k nearest training labels, the k nearest training instances and creates a chart highlighting the nearest training instances (For plotting, instances must have only two or three features (2-D or 3-D).
2. Returns the estimated labels of one or multiple test instances and the accuracy of the estimates.

Examples
>> load fisheriris

>> X = meas;

>> Y = species;

>> Xnew = [min(X);mean(X);max(X)];

>> k = 5;

>> label = predict_knn(X,Y,Xnew,k)


label = 

    'setosa'
    'versicolor'
    'virginica'

See more examples described in the script files.
