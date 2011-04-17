nUsers=1000990;  
outfile = 'users.mat';
tic

% create a dense matrix users from sparse matrix K
% row_id is the user number
% 1. num_ratings = size(user_ratings,1);
% 2. mean_rating = mean(user_ratings);
% 3. user_bias = mean_rating - MU;
% 4. std_rating = std(user_ratings); 
% 5. min_rating = min(user_ratings);
% 6. max_rating = max(user_ratings);
% 7. median_rating = median(user_ratings);
% 8. mode_rating = mode(user_ratings);
    
users = zeros(nUsers, 8, 'single');
for j=1:nUsers
    user = nonzeros(K(:,j)); 
    %hist(user)    
    users(j, 1) = nnz(K(:,j));
    users(j, 2) = mean(user);
    users(j, 3) = users(j, 2)-MU; % user bias
    users(j, 4) = std(user);
 
    users(j, 5) = min(user);
    users(j, 6) = max(user);
    users(j, 7) = median(user);
    users(j, 8) = mode(user);
    
end

save(outfile,'-v7.3','users');
toc  
