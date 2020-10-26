%Examples using Iris Data Set

load fisheriris

X = meas;
Y = species;
Xnew = [min(X);mean(X);max(X)];
k = 5;
metric = 'euclidean';

mdl = kNNeighbors(k,metric);
mdl = mdl.fit(X,Y)
Ypred = mdl.predict(Xnew)

Ynew = {'versicolor';'versicolor';'virginica'};
accuracy = accuracy_score(Ypred,Ynew)
