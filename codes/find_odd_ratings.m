% list of entries (row,col) that has rating not divisible by 10
% find ratings that has mod(K,10) = 1 or 2,3,4,5,6,7,8,9.
% assuming load trainAll has executed 

outfile='odd_ratings.mat';  

tic

M = mod(K,10); 
clear K;

[r,c]= find(M>=1);
clear M;

odd_ratings = cat(2,r,c);

clear r;
clear c;

save(outfile,'-v7.3','odd_ratings');  

toc  
