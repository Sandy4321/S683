% stats of vusers having highest number of ratings vs vusers having lowest
% number of ratings vs random vusers 
% load vusers first

format long;

nUsers=1000990;

k = 10;

if exist('vusers')
else 
    load vusers.mat;
end

while (true) 
    disp('1) for stats about users havinng highest no of ratings');
    disp('2) for stats about users havinng highest mean rating');    
    disp('3) for stats about users havinng highest rating bias');
    disp('4) for stats about users havinng highest rating variance ');
    disp('-1) for exit');
    
    option_id = input('Enter option id: '); 
    if option_id == -1
        break;
    end

    my_user_ratings = vusers(:,option_id);
    [~, p] = sort(abs(my_user_ratings));

    n = size(p,1);
    most_active_idx = p(n-k+1:n);
    least_active_idx = p(1:k);
    rand_user_idx = randi(nUsers,k,1);

    most_active_users = [most_active_idx, vusers(most_active_idx,:)];
    least_active_users = [least_active_idx, vusers(least_active_idx,:)];
    random_users = [rand_user_idx, vusers(rand_user_idx,:)];

    most_active_stats = dataset({most_active_users, 'user_id', 'number_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});
    fprintf('%d users having highest: \n', k);
    fprintf('These users have susceptive biases and influence predicted ratings???? : \n');
    disp(most_active_stats);

    least_active_stats = dataset({least_active_users, 'user_id', 'num_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});
    fprintf('%d users having lowest: \n', k);
    disp(least_active_stats);

    rand_user_stats = dataset({random_users, 'user_id', 'num_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});
    fprintf('%d random users : \n', k);
    disp(rand_user_stats);
end
