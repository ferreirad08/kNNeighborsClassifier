# k-Nearest Neighbors (kNN) Classifier

[![View k-Nearest Neighbors (kNN) Classifier on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://ww2.mathworks.cn/matlabcentral/fileexchange/67018-k-nearest-neighbors-knn-classifier)

Function 
1. kNNeighbors.predict(_)
2. kNNeighbors.find(_)

Description 
1. Returns the estimated labels of one or multiple test instances.
2. Returns the indices and the respective distances of the k nearest training instances.

Examples using Iris Data Set

    load fisheriris
    
    X = meas;
    Y = species;
    Xnew = [min(X);mean(X);max(X)];
    k = 5;
    metric = 'euclidean';
    
    mdl = kNNeighbors(k,metric);
    mdl = mdl.fit(X,Y);
    Ypred = mdl.predict(Xnew)
    
    Ypred =
    
        'setosa'
        'versicolor'
        'virginica'
        
        
    Ynew = {'versicolor';'versicolor';'virginica'};
    accuracy = accuracy_score(Ypred,Ynew)
    
    accuracy =
    
        0.6667

See more examples described in the script files.
