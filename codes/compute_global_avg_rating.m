% compute MU (total avarage rating) from the whole training set
% assuming the training set has been loaded into sparse matrix K;

nUsers=1000990;  
outfile = 'mu.mat';

tic

nRatings = nnz(K);
ssq = sum(nonzeros(K));
MU = ssq/nRatings;

save(outfile,'-v7.3','MU');
toc  


