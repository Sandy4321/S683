nUsers=1000990;  
nItems=624961;  

outfile='transpose2.mat';  % transpose K ans assign to T2

nBlocks = 99; 
nPART1 = 100000;
nPART2 = 200000;

tic
T2 = sparse(nUsers, nItems); % use this if out of memory

nBegin = nPART1+1;
while (nBegin <= nPART2)
    nEnd = min(nBegin+nBlocks, nPART2);
    fprintf('Copying from: %d, to: %d \n', nBegin, nEnd);
    T2(:,nBegin:nEnd) = K(nBegin:nEnd,:)';
    nBegin = nEnd+1;    
end

clear K;

save(outfile,'-v7.3','T2');

toc 
