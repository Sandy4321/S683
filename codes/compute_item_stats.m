nItems=624961;  

outfile = 'items.mat';

tic

% create a item statistics  matrix from sparse matrix T
% row_id is the item number
% column 1: # of ratings
% column 2: mean score. average rating.
% column 3: item bias
% column 4: std deviation 
% column 5: min score 
% column 6: max score 
% column 7: median score 
% column 8: mode score 

items = zeros(nItems, 8, 'single');
for j=1:nItems
        if nnz(T(:,j)) > 0
            item = nonzeros(T(:,j));
            
            items(j, 1) = nnz(T(:,j));
            items(j, 2) = mean(item);
            items(j, 3) = items(j, 2)-MU;
            items(j, 4) = std(item);
            
            items(j, 5) = min(item);
            items(j, 6) = max(item);
            items(j, 7) = median(item);
            items(j, 8) = mode(item);
        end
end

save(outfile,'-v7.3','items');
toc  
