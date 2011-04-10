nUsers=1000990;  
nItems=624961;  
nTrainRatings=252800275;  
ratings=nTrainRatings;

trainfile='trainIdx1.txt';
outfile='train1.mat';  % first half

%trainMat = sparse(nUsers, nItems);
K = spalloc(nItems, nUsers,nTrainRatings); % size 4052812328

%nUsers = 200; % Elapsed 116.976717 seconds. 
%nUsers = 400; % Elapsed 317.233400 seconds. 348KB
%nUsers = 800; % Elapsed 593.328665 seconds. 588KB. store entry by entry 
%nUsers = 800; % Elapsed  7.702923 seconds. only reading time. no storing
%nUsers = 800;  % Elapsed 16.286398 seconds. store column by column 
%nUsers = 8000; % Elapsed 151.722152 seconds. store column by column 
nUsers = 500000; % Elapsed 19597.236035 seconds. size(train1.mat) = 296MB

tic
try    
    ff=fopen(trainfile,'r');
    cnt=1;
    for j=1:nUsers  
        % read user id and number of ratings  
        [a,num]=fscanf(ff,'%d|%d',2);  
        
        user=a(1);
        col_id = user + 1; % column u
        
        noRatings=a(2);
        userRatings = zeros(nItems,1);        
        
        for i=1:noRatings % for each rating
            b=-100;  
            [b,num]=fscanf(ff,'%d %d %d %d:%d:%d',6);              

            row_id = b(1)+1; % row (item) i  
  
            val = b(2); % rating  
            assert(val >= 0 && val <= 100);  
            
            userRatings(row_id) = val;            
        end
        
        K(:,col_id) = userRatings;
        
    end
catch ex  
    disp('exception on ');  
    ex;  
end

toc  
%construct and save a sparse Matlab matrix  
save(outfile,'-v7.3','K');  

whos K; % size 4052812328?
