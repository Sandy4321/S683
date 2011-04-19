% display true rating and predicted rating for each user in the probe set
% load validation
% load predict4probe
% load users
% load vusers
% load items
% load vitems

nUsers=1000990;  
nItems=624961;  

%format long;
format bank;

while (true) 
    user_id = input('Enter user id: ');    
    if user_id == -1
        break;
    end
    
   
    [~, ~, pRatings] = find(P(:,user_id));
    [ids, ~, tRatings] = find(V(:,user_id));
    
    n = nnz(V(:,user_id));
    uids = zeros(n,1) + user_id;        
    all_ratings = [uids, ids, pRatings, tRatings, pRatings-tRatings]; 
    rating_report = dataset({all_ratings, 'user_id', 'item_id', 'predicted_rating', 'true_rating', 'predicted_error'});
    
    fprintf('training/estimation statistics for user %d: \n', user_id);
    user_arr =  [user_id, users(user_id,:)];
    user_stat = dataset({user_arr, 'user_id', 'num_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});
    disp(user_stat);    
        
    fprintf('validation statistics for user %d: \n', user_id);
    vuser_arr =  [user_id, vusers(user_id,:)];
    vuser_stat = dataset({vuser_arr, 'user_id', 'num_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});
    disp(vuser_stat);
        
    fprintf('training statistics for associated items \n');
    item_arr = [ids, items(ids,:)];
    item_stat = dataset({item_arr, 'item_id', 'num_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});    
    disp(item_stat);
    
    fprintf('validation statistics for associated items \n');
    vitem_arr = [ids, vitems(ids,1:8)];
    vitem_stat = dataset({vitem_arr, 'item_id', 'num_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});    
    disp(vitem_stat);
    
    fprintf('predicted ratings vs true ratings for user %d \n', user_id); 
    disp(rating_report);
    
end

