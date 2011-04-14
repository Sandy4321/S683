nItems=624961;  

outfile = 'items.mat';

tic

% create a dense matrix users from sparse matrix K
% row_id is the item number
% column 1: # of ratings
% column 2: mean score. average rating.
% column 3: min score 
% column 4: max score 
% column 5: median score 
% column 6: mode score 
% column 7: user bias
items = zeros(nItems, 7, 'single');

i = 1;
nBlock = 10;

while (i <= nItems)
    
    next = i+nBlock-1;
    temp = K(i:next,:)'; %transpose 10 rows to column format
    
    for j=1:nBlock
        item = nonzeros(temp(:,j));     
        iidx = i+j-1; %item index
        items(iidx, 1) = sum(item > 0);
        items(iidx, 2) = mean(item);
        items(iidx, 3) = min(item);
        items(iidx, 4) = max(item);
        items(iidx, 5) = median(item);
        items(iidx, 6) = mode(item);
        items(iidx, 7) = mean(item)-MU;
    end
    
    i = min(next+1, nItems);

end

save(outfile,'-v7.3','items');
toc  
