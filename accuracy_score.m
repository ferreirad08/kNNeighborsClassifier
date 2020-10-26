function accuracy = accuracy_score(Ypred,Ynew)
%Accuracy Score
%
% Author: M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com
% Date: October 2020

[name_labels,~,Ypred] = unique(Ypred); % Numeric predicted labels
[~,Ynew] = ismember(Ynew,name_labels); % Numeric new labels
accuracy = mean(Ypred == Ynew); % calculated accuracy
end
