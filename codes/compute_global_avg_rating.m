% compute MU (total avarage rating) from the whole training set
% assuming the training set has been loaded into sparse matrix K;

nUsers=1000990;  
nTrainRatings=252800275;
ratings=nTrainRatings;

outfile = 'mu.mat';

tic

MU = 0;

s = 0;
c = 0;
for j=1:nUsers
    user = K(:,j); 
    s = s + sum(user);
    c = c + sum( user > 0 );
end

MU = s/c;

save(outfile,'-v7.3','MU');
toc  