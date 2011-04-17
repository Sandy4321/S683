% stats of items having highest number of ratings vs items having lowest
% number of ratings vs random items 
% load items first

format long;
nItems=624961;

k = 10;

if exist('items')
else 
    load items.mat;
end

num_item_ratings = items(:,1);
[~, p] = sort(num_item_ratings);

n = size(p,1);
most_active_idx = p(n-k+1:n);
least_active_idx = p(1:k);
rand_item_idx = randi(n,k,1);
 
most_active_items = [most_active_idx, items(most_active_idx,:)];
least_active_items = [least_active_idx, items(least_active_idx,:)];
random_items = [rand_item_idx, items(rand_item_idx,:)];

most_active_stats = dataset({most_active_items, 'item_id', 'number_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});
fprintf('%d items having highest number of ratings : \n', k);
fprintf('These items have susceptive biases and influence predicted ratings???? : \n');
disp(most_active_stats);

least_active_stats = dataset({least_active_items, 'item_id', 'num_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});
fprintf('%d items having lowest number of ratings : \n', k);
disp(least_active_stats);

rand_item_stats = dataset({random_items, 'item_id', 'num_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});
fprintf('%d random items : \n', k);
disp(rand_item_stats);
