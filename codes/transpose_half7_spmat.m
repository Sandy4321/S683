nUsers=1000990;  
nItems=624961;  

outfile='transpose7.mat';  % transpose K ans assign to T

nBlocks = 99; 

nPART6 = 600000;

tic

T7 = sparse(nUsers, nItems); % use this if out of memory

nBegin = nPART6+1;
while (nBegin <= nUsers)
    nEnd = min(nBegin+nBlocks, nUsers);
    fprintf('Copying from: %d, to: %d \n', nBegin, nEnd);
    T7(:,nBegin:nEnd) = K(nBegin:nEnd,:)';
    nBegin = nEnd+1;    
end

clear K;
save(outfile,'-v7.3','T7');

toc 
