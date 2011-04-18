% plot histogram of user ratings
% load trainAll.mat and mu.mat first
while (true) 
    user_id = input('Enter user id: ');    
    if user_id == -1
        break;
    end

    if nnz(K(:,user_id)) > 0            
        user_ratings = nonzeros(K(:,user_id)); 
        fprintf('List of user ratings: \n');
        disp(K(:,user_id));

        edges = 0:10:110;
        labels = strcat(num2str((0:10:100)','%d'),{'s'});
        fprintf('Tabulation: \n');    
        tabulate(ordinal(user_ratings,labels,[],edges));

        num_ratings = size(user_ratings,1);
        mean_rating = mean(user_ratings);
        user_bias = mean_rating - MU;
        sd_rating = std(user_ratings);

        min_rating = min(user_ratings);
        max_rating = max(user_ratings);
        median_rating = median(user_ratings);
        mode_rating = mode(user_ratings);

        user_arr =  [user_id, num_ratings, mean_rating, user_bias, sd_rating, min_rating, max_rating, median_rating, mode_rating];
        user_stat = dataset({user_arr, 'user_id', 'num_ratings', 'mean', 'user_bias', 'std', 'min', 'max', 'median', 'mode'});
        fprintf('Summary statistics: \n');
        disp(user_stat);

        hist(user_ratings);
    else 
        disp('this user has no rating');
    end        
end
