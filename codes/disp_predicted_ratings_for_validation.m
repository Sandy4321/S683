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
    
    fprintf('true rating for user %d: \n', user_id);
    disp(V(:,user_id)); % display observed rating in the validation set
    
    [ids, ~, ~] = find(V(:,user_id));
    fprintf('training/estimation statistics for user %d: \n', user_id);
    %disp(users(user_id,:));
    user_arr =  [user_id, users(user_id,:)];
    user_stat = dataset({user_arr, 'user_id', 'num_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});
    disp(user_stat);    
        
    fprintf('validation statistics for user %d: \n', user_id);
    %disp(vusers(user_id,:));
    vuser_arr =  [user_id, vusers(user_id,:)];
    vuser_stat = dataset({vuser_arr, 'user_id', 'num_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});
    disp(vuser_stat);
        
    fprintf('training statistics for associated items \n');
    %disp(items(ids,:));
    item_arr = [ids, items(ids,:)];
    item_stat = dataset({item_arr, 'item_id', 'num_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});    
    disp(item_stat);
    
    fprintf('validation statistics for associated items \n');
    %disp(vitems(ids,:));        
    vitem_arr = [ids, vitems(ids,1:8)];
    vitem_stat = dataset({vitem_arr, 'item_id', 'num_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});    
    disp(vitem_stat);
    
    fprintf('predicted ratings for user %d \n', user_id);
    disp(P(:,user_id)); % display predicted ratings     
end

