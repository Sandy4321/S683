% compute the root mean square error by comparing predicted and target values 
% for those data points in the probe set.
% Assuming the following has done:
% 1) load trainAll.mat (i.e. K sparse matrix is in memory)
% 2) load users.mat
% 3) load items.mat
% 4) load mu.mat

% steps:
% 1. create a dense matrix P = [i,j,v] = find(V);
% 2. add a predicted colum next to v. P = cat(2,P, pred)
% 3. compute the deviation.  deviation^2, sum(deviation^2)
% 4. RMSE= sum(deviation^2)/size(P,1)

nUsers=1000990;  
nItems=624961;  

outfile='predict4train.mat';  % transpose K ans assign to T1

tic

n = nnz(K);

[rows,cols,vals] = find(K);
clear K;

pred = zeros(n,1);

for i= 1:n
    item = rows(i,1);
    user = cols(i,1);
    pred(i) = MU + users(user,7) + items(item,7);
end

clear users;
clear items;
clear MU;

dev = vals - pred ;
sse = sum(dev.^2);
rmse = sqrt(sse/n);
fprintf('RMSE:  %10.4f \n', rmse);

clear vals;

P = sparse(rows,cols,pred,nItems,nUsers);

clear rows;
clear cols;
clear pred;

save(outfile,'-v7.3','P', 'sse', 'rmse');

toc