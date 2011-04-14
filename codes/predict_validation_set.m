% compute predicted ratings for validation set 
% assuming the following has done:
% 1) load valid.mat (i.e. V sparse matrix is in memory)

nUsers=1000990;  
nItems=624961;  
nTrainRatings=252800275;
ratings=nTrainRatings;

outfile = 'predict_validation.mat';

tic

[m,n] = size(V);
[rows, cols] =find(V);
nRows = size(rows,1);
vals = zeros(nRows,1,'single');

clear V;
load mu.mat;
load users.mat
load items.mat;

for j=1:nRows
    item = rows(j); %item
    user = cols(j); % user
    
    user_biases = users(:,7);  % all user biases 
    user_bias = user_biases(user); % user bias
    
    item_biases = items(:,7);  % all item biases 
    item_bias = item_biases(item);  % item bias
    
    vals(j) = MU + user_bias + item_bias; % predicted value
end

P = sparse(rows,cols,vals,m,n);
save(outfile,'-v7.3','P');
toc  
