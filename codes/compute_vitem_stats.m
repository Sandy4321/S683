% create a item statistics  matrix from sparse matrix VT
% load vt 
% load vmu

nItems=624961;  
outfile = 'vitems.mat';

tic

% row_id is the item number
% column 1: # of ratings
% column 2: mean score. average rating.
% column 3: item bias
% column 4: std deviation 
% column 5: min score 
% column 6: max score 
% column 7: median score 
% column 8: mode score 

vitems = zeros(nItems, 9, 'single');
for j=1:nItems
        if nnz(VT(:,j)) > 0
            item = nonzeros(VT(:,j));
            
            vitems(j, 1) = nnz(VT(:,j));
            vitems(j, 2) = mean(item);
            vitems(j, 3) = vitems(j, 2)-vMU;
            vitems(j, 4) = std(item);
            
            vitems(j, 5) = min(item);
            vitems(j, 6) = max(item);
            vitems(j, 7) = median(item);
            vitems(j, 8) = mode(item);
        end
end

% see which item are not in the probe set 
vitems(:,9) = vitems(:, 1) > 0;

save(outfile,'-v7.3','vitems');
toc  
