nUsers=1000990;  
nItems=624961;  
nTrainRatings=252800275;
ratings=nTrainRatings;

outfile = 'users.mat';

tic

% create a dense matrix users from sparse matrix K
% row_id is the user number
% column 1: # of ratings
% column 2: mean score. average rating.
% column 3: min score 
% column 4: max score 
% column 5: median score 
% column 6: mode score 
% column 7: user bias
users = zeros(nUsers, 7, 'single');
for j=1:nUsers
    user = nonzeros(K(:,j)); 
    %hist(user)    
    users(j, 1) = sum(user > 0);
    users(j, 2) = mean(user);
    users(j, 3) = min(user);
    users(j, 4) = max(user);
    users(j, 5) = median(user);
    users(j, 6) = mode(user);
    users(j, 7) = mean(user)-MU;
end

save(outfile,'-v7.3','users');
toc  
