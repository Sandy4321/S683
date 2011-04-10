nUsers=1000990;  
nItems=624961;  
nTrainRatings=252800275;  
ratings=nTrainRatings;

trainfile='trainIdx1.txt';
infile1='train1.mat';  % first half
infile2='train2.mat';  % first half
outfile='trainAll.mat';  % full matrix

nHalf1 = 500000; 

tic

load train1.mat;
load train2.mat;

K(:,nHalf1+1:nUsers) = S(:,nHalf1+1:nUsers);
clear S;

toc  
%construct and save a sparse Matlab matrix  
save(outfile,'-v7.3','K');  

whos K; % size 4052812328?
