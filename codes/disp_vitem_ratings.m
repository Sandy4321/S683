% plot histogram of item ratings in the validation set 
% load vt.mat and vmu.mat first
while (true) 
    item = input('Enter item id: ');    
    if item == -1
        break;
    end
    
    if nnz(VT(:,item)) > 0
        item_ratings = nonzeros(VT(:,item)); 
        num_disp = min(100,size(item_ratings,1));
        fprintf('List of first %d item ratings: ', num_disp );
        fprintf('%3.0f,',item_ratings(1:num_disp));
        fprintf('\n');

        edges = 0:10:110;
        labels = strcat(num2str((0:10:100)','%d'),{'s'});
        fprintf('Tabulation: \n');    
        tabulate(ordinal(item_ratings,labels,[],edges));

        num_ratings = size(item_ratings,1);
        mean_rating = mean(item_ratings);
        item_bias = mean_rating - vMU;
        sd_rating = std(item_ratings);

        min_rating = min(item_ratings);
        max_rating = max(item_ratings);
        median_rating = median(item_ratings);
        mode_rating = mode(item_ratings);

        item_arr =  [item, num_ratings, mean_rating, item_bias, sd_rating, min_rating, max_rating, median_rating, mode_rating];
        item_stat = dataset({item_arr, 'item_id', 'num_ratings', 'mean', 'item_bias', 'std', 'min', 'max', 'median', 'mode'});
        fprintf('Summary statistics: \n');
        disp(item_stat);

        hist(item_ratings);
    else 
        disp('this item has no rating in the validation set');
    end
    
end
