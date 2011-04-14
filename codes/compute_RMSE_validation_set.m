% compute the root mean square error by comparing predicted and target values 
% for those data points in the probe set.
% Assuming the following has done:
% 1) load valid.mat (i.e. V sparse matrix is in memory)
% 2) load predict_validation.mat;

tic

pred = nonzeros(P);
target = nonzeros(V);

deviations = target - pred ;
ss = sum(deviations.^2);
n = size(pred,1);
rmse = sqrt(ss/n);
fprintf('RMSE:  %10.4f \n', rmse);
toc  
