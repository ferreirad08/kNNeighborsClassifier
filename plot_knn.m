function plot_knn(X,Y,Xnew,k)
%k-Nearest Neighbors (kNN)
%
%Author: David Ferreira - Federal University of Amazonas
%Contact: ferreirad08@gmail.com
%
%plot_knn
%
%Syntax
%1. plot_knn(X,Y,Xnew,k)
%
%Description 
%1. Creates a graphic highlighting the nearest training instances. For plotting, instances must have only two or three features (2-D or 3-D).
%
%X is an M-by-N matrix, with M instances of N features. 
%Y is an M-by-1 matrix, with respective M labels to each training instance. 
%Xnew is an 1-by-N matrix, with one instance of N features to be classified.
%k is a scalar, with the number of nearest neighbors selected.
%
%Example
%1.
%     X = [8 5 1; 3 7 2; 3 6 3; 7 3 1]; 
%     Y = {'fruit';'vegetable';'protein';'fruit'}; 
%     Xnew = [6 4 1];
%     k = 3;
%     plot_knn(X,Y,Xnew,k)
%         Note: images 2-D and 3-D are among the downloaded files.

% Check the number of input arguments
    switch size(X,2)
        case 2
            figure
            [Y,C,~,distances,Markers] = prepare(X,Y,Xnew,k);
            
            r = distances(k);
            xc = Xnew(1);
            yc = Xnew(2);

            theta = linspace(0,2*pi);
            x = r*cos(theta) + xc;
            y = r*sin(theta) + yc;
            plot(x,y,':k')
            axis equal

            plot(xc,yc,'xk','MarkerSize',8,'LineWidth',2)

            for i = 1:numel(C)
                L = find(Y==C(i));
                plot(X(L,1),X(L,2),Markers{i})
            end
        case 3
            figure
            plot3(Xnew(1),Xnew(2),Xnew(3),'xk','MarkerSize',8,'LineWidth',2)
            [Y,C,Xnearest,~,Markers] = prepare(X,Y,Xnew,k);
            
            for i = 1:k
                plot3([Xnew(1) Xnearest(i,1)],[Xnew(2) Xnearest(i,2)],[Xnew(3) Xnearest(i,3)],':k')
            end

            for i = 1:numel(C)
                L = find(Y==C(i));
                plot3(X(L,1),X(L,2),X(L,3),Markers{i})
            end            
        otherwise
            error('For plotting, instances must have only two or three features (2-D or 3-D).')
    end
end

function [Y,C,Xnearest,distances,Markers] = prepare(X,Y,Xnew,k)
hold on
grid on
[~,~,Y] = unique(Y,'stable');
C = unique(Y);
[Xnearest,~,distances] = find_knn(X,Y,Xnew,k);
Markers = {'o','s','^','d','v','>','<','p','h','+','*','.'};
end
