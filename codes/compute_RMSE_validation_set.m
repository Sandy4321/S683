% compute the root mean square error by comparing predicted and target values 
% for those data points in the probe set.
% Assuming the following has done:
% 1) load validation.mat (i.e. V sparse matrix is in memory)
% 2) load users.mat
% 3) load items.mat
% 4) load mu.mat

% steps:
% 1. create a dense matrix P = [i,j,v] = find(V);
% 2. add a predicted colum next to v. P = cat(2,P, pred)
% 3. compute the deviation.  deviation^2, sum(deviation^2)
% 4. RMSE= sum(deviation^2)/size(P,1)

tic

[rows,cols,vals] = find(V);
P = cat(2,rows,cols,vals);
n = size(P,1);
pred = zeros(n,1);

for i= 1:n
    item = P(i,1);
    user = P(i,2);
    pred(i) = MU + users(user,7) + items(item,7);
end

P = cat(2,P,pred);

dev = P(:,3) - P(:,4) ;
sse = sum(dev.^2);
rmse = sqrt(sse/n);
fprintf('RMSE:  %10.4f \n', rmse);
toc  
