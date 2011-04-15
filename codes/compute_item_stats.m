nItems=624961;  

outfile = 'items.mat';

tic

% create a item statistics  matrix from sparse matrix T
% row_id is the item number
% column 1: # of ratings
% column 2: mean score. average rating.
% column 3: min score 
% column 4: max score 
% column 5: median score 
% column 6: mode score 
% column 7: item bias

items = zeros(nItems, 7, 'single');
for j=1:nItems
        if nnz(T(:,j)) > 0
            item = nonzeros(T(:,j));
            items(j, 1) = sum(item > 0);
            items(j, 2) = mean(item);
            items(j, 3) = min(item);
            items(j, 4) = max(item);
            items(j, 5) = median(item);
            items(j, 6) = mode(item);
            items(j, 7) = mean(item)-MU;
        end
end

save(outfile,'-v7.3','items');
toc  
