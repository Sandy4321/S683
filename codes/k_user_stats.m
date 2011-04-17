% stats of users having highest number of ratings vs users having lowest
% number of ratings vs random users 
% load users first

format long;

nUsers=1000990;

k = 10;

if exist('users')
else 
    load users.mat;
end

num_user_ratings = users(:,1);
[~, p] = sort(num_user_ratings);

n = size(p,1);
most_active_idx = p(n-k+1:n);
least_active_idx = p(1:k);
rand_user_idx = randi(nUsers,k,1);
 
most_active_users = [most_active_idx, users(most_active_idx,:)];
least_active_users = [least_active_idx, users(least_active_idx,:)];
random_users = [rand_user_idx, users(rand_user_idx,:)];

most_active_stats = dataset({most_active_users, 'user_id', 'number_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});
fprintf('%d users having highest number of ratings : \n', k);
fprintf('These users have susceptive biases and influence predicted ratings???? : \n');
disp(most_active_stats);

least_active_stats = dataset({least_active_users, 'user_id', 'num_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});
fprintf('%d users having lowest number of ratings : \n', k);
disp(least_active_stats);

rand_user_stats = dataset({random_users, 'user_id', 'num_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});
fprintf('%d random users : \n', k);
disp(rand_user_stats);
