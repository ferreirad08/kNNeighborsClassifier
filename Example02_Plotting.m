%Examples with Plotting

load fisheriris

X = meas(:,3:4);
Y = species;
Xnew = [min(X);mean(X);max(X)];
k = 5;
metric = 'euclidean';

mdl = kNNeighbors(k,metric);
mdl = mdl.fit(X,Y)
[distances,indices] = mdl.find(Xnew)

hold on
plot(X(1:50,1),X(1:50,2),'o') % only setosas
plot(X(51:100,1),X(51:100,2),'o') % only versicolors
plot(X(101:150,1),X(101:150,2),'o') % only virginics
plot(Xnew(:,1),Xnew(:,2),'xk')

legend({'setosa','versicolor','virginica','new instances'},'Location','northwest')

theta = linspace(0,2*pi);
for i = 1:3
    x = distances(k,i)*cos(theta) + Xnew(i,1);
    y = distances(k,i)*sin(theta) + Xnew(i,2);
    plot(x,y,'--k')
end

axis equal
hold off
saveas(gca, '2-D_graphic', 'png')
