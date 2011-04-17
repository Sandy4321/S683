% compute MU (total avarage rating) from the whole training set
% assuming the training set has been loaded into sparse matrix K;

outfile = 'vmu.mat';

tic

nRatings = nnz(V);
ssq = sum(nonzeros(V));
vMU = ssq/nRatings;

save(outfile,'-v7.3','vMU');
toc  


