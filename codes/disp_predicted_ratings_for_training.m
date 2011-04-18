% display true rating and predicted rating for each user in the training set
% load trainAll
% load predict4train
% load users
% load items

nUsers=1000990;  
nItems=624961;  

%format short;
format bank;

while (true) 
    user_id = input('Enter user id: ');    
    if user_id == -1
        break;
    end
    
    fprintf('training/estimation statistics for user %d: \n', user_id);
    %disp(users(user_id,:));    
    user_arr =  [user_id, users(user_id,:)];
    user_stat = dataset({user_arr, 'user_id', 'num_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});    
    disp(user_stat);
    
    [ids, uids, tRatings] = find(K(:,user_id));
    [~, ~, pRatings] = find(P(:,user_id));    
    all_ratings = [ids, uids, pRatings, tRatings, pRatings-tRatings];
    rating_report = dataset({all_ratings, 'item_id', 'user_id', 'predicted_rating', 'true_rating', 'predicted_error'});
    
    fprintf('training statistics for associated items \n');
    %disp(items(ids,:));
    item_arr = [ids, items(ids,:)];
    item_stat = dataset({item_arr, 'item_id', 'num_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});    
    disp(item_stat);

    fprintf('predicted ratings vs true ratings for user %d \n', user_id); 
    disp(rating_report);
    
    
end
