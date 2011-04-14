%Deprecated: 
% Should use spconvert to import from sparse matrix external format
% http://www.mathworks.com/help/techdoc/ref/spconvert.html
nUsers=1000990;  
nItems=624961;  
nProbeRatings=4003960;
ratings=nProbeRatings;

RATINGS_PER_USER_VALIDATION=4;

infile='validationIdx1.txt';
outfile='valid.mat';  % validation dataset in sparse matrix V

V = spalloc(nItems, nUsers,nProbeRatings); % size 

tic
try    
    ff=fopen(infile,'r');
    cnt=1;
    for j=1:nUsers
        % read user id and number of ratings  
        [a,num]=fscanf(ff,'%d|%d',2);  
        
        user=a(1);
        col_id = user + 1; % column u
        
        noRatings=a(2);
        assert(noRatings == RATINGS_PER_USER_VALIDATION);
        
        userRatings = zeros(nItems,1);
        for i=1:noRatings % for each rating
            b=-100;  
            [b,num]=fscanf(ff,'%d %d %d %d:%d:%d',6);              

            row_id = b(1)+1; % row (item) i  
  
            val = b(2); % rating  
            assert(val >= 0 && val <= 100);
            
            if (val ==0)
                val = 0.0000000001;
            end
            userRatings(row_id) = val;
        end
        
        V(:,col_id) = userRatings;
        
    end
catch ex  
    disp('exception on ');  
    ex;  
end

toc  
save(outfile,'-v7.3','V');  
whos V; % size 4052812328?
