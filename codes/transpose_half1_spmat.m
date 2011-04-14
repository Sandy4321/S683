nUsers=1000990;  
nItems=624961;  

outfile='transpose1.mat';  % transpose K ans assign to T1

T1 = sparse(nUsers, nItems); % use this if out of memory
nBlocks = 99; 


nPART1 = 100000;

tic

nBegin = 1;
while (nBegin <= nPART1)
    nEnd = min(nBegin+nBlocks, nPART1);
    fprintf('Copying from: %d, to: %d \n', nBegin, nEnd);
    T1(:,nBegin:nEnd) = K(nBegin:nEnd,:)';
    nBegin = nEnd+1;    
end

toc  

clear K;

save(outfile,'-v7.3','T1');
