# k-Nearest Neighbors (kNN) Algorithm

Function 
1. predict_knn
2. find_knn
3. plot_knn

Description 
1. Returns the estimated labels of one or multiple test instances and the accuracy of the estimates.
2. Returns the k nearest training instances, the k nearest training labels and the respective distances.
3. Creates a graphic highlighting the nearest training instances (For plotting, instances must have only two or three features (2-D or 3-D)).

Examples using Iris Data Set

    load fisheriris
    X = meas;
    Y = species;
    Xnew = [min(X);mean(X);max(X)];
    k = 5;
    label = predict_knn(X,Y,Xnew,k)
    
    label =
    
        'setosa'
        'versicolor'
        'virginica'
        
        
    Ynew = {'versicolor';'versicolor';'virginica'};
    [label,accuracy] = predict_knn(X,Y,Xnew,k,Ynew)
    
    label =
    
        'setosa'
        'versicolor'
        'virginica'
        
    accuracy =
    
        0.6667

See more examples described in the script files.
