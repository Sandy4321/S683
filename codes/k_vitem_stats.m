% stats of items having highest number of ratings vs items having lowest
% number of ratings vs random items 
% load vitems first

format long;
nItems=624961;

k = 10;

if exist('vitems')
else 
    load vitems.mat;
end

while (true) 
    disp('1) for stats about items havinng highest no of ratings');
    disp('2) for stats about items havinng highest mean rating');    
    disp('3) for stats about items havinng highest rating bias');
    disp('4) for stats about items havinng highest rating variance ');
    disp('-1) for exit');
    
    option_id = input('Enter option id: '); 
    if option_id == -1
        break;
    end

    my_item_ratings = vitems(:,option_id);
    [~, p] = sort(abs(my_item_ratings));

    n = size(p,1);
    most_active_idx = p(n-k+1:n);
    least_active_idx = p(1:k);
    rand_item_idx = randi(n,k,1);

    most_active_items = [most_active_idx, vitems(most_active_idx,:)];
    least_active_items = [least_active_idx, vitems(least_active_idx,:)];
    random_items = [rand_item_idx, vitems(rand_item_idx,:)];

    most_active_stats = dataset({most_active_items, 'item_id', 'number_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});
    fprintf('Highest: \n');
    disp(most_active_stats);

    least_active_stats = dataset({least_active_items, 'item_id', 'num_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});
    fprintf('Lowest: \n');
    disp(least_active_stats);

    rand_item_stats = dataset({random_items, 'item_id', 'num_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});
    fprintf('%d random items : \n', k);
    disp(rand_item_stats);
end
