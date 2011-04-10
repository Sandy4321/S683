nUsers=1000990;  
nItems=624961;  
nTrainRatings=252800275;  
ratings=nTrainRatings;

trainfile='trainIdx1.txt';
outfile='train2.mat';  % second half
nHalf1 = 500000; 

tic
try    
    ff=fopen(trainfile,'r');
    for j=1:nHalf1  
        % read user id and number of ratings  
        [a,num]=fscanf(ff,'%d|%d',2);  
        noRatings=a(2);
        for i=1:noRatings % for each rating
            b=-100;  
            [b,num]=fscanf(ff,'%d %d %d %d:%d:%d',6);              
        end
    end
    
    S = spalloc(nItems, nUsers,nTrainRatings); 

    % second half
    for k=nHalf1+1:nUsers
        % read user id and number of ratings  
        [a,num]=fscanf(ff,'%d|%d',2);  
        
        user=a(1);
        col_id = user + 1; % column (user) u
        
        noRatings=a(2);
        userRatings = zeros(nItems,1);        
        
        for i=1:noRatings % for each rating
            b=-100;  
            [b,num]=fscanf(ff,'%d %d %d %d:%d:%d',6);              

            row_id = b(1)+1; % item/row i  
  
            val = b(2); % rating  
            assert(val >= 0 && val <= 100);  
            
            userRatings(row_id) = val;            
        end
        
        S(:,col_id) = userRatings;
        
    end

catch ex  
    disp('exception on ');  
    ex;  
end
    
toc  
%construct and save a sparse Matlab matrix  
save(outfile,'-v7.3','S');  

whos S; % size 4052812328?
