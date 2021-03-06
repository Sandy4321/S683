% create a dense matrix vusers from sparse matrix V
% load validation
% load vmu

nUsers=1000990;  
outfile = 'vusers.mat';
tic

% row_id is the user number
% 1. num_ratings = size(user_ratings,1);
% 2. mean_rating = mean(user_ratings);
% 3. user_bias = mean_rating - MU;
% 4. std_rating = std(user_ratings); 
% 5. min_rating = min(user_ratings);
% 6. max_rating = max(user_ratings);
% 7. median_rating = median(user_ratings);
% 8. mode_rating = mode(user_ratings);
    
vusers = zeros(nUsers, 8, 'single');
for j=1:nUsers
    user = nonzeros(V(:,j)); 
    %hist(user)    
    vusers(j, 1) = nnz(V(:,j));
    vusers(j, 2) = mean(user);
    vusers(j, 3) = vusers(j, 2)-vMU; % user bias
    vusers(j, 4) = std(user);
 
    vusers(j, 5) = min(user);
    vusers(j, 6) = max(user);
    vusers(j, 7) = median(user);
    vusers(j, 8) = mode(user);
    
end

save(outfile,'-v7.3','vusers');
toc  
