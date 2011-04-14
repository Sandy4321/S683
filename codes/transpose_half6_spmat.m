nUsers=1000990;  
nItems=624961;  

outfile='transpose6.mat';  % transpose K ans assign to T

nBlocks = 99; 
nPART5 = 500000;
nPART6 = 600000;

tic

T6 = sparse(nUsers, nItems); % use this if out of memory

nBegin = nPART5+1;
while (nBegin <= nPART6)
    nEnd = min(nBegin+nBlocks, nPART6);
    fprintf('Copying from: %d, to: %d \n', nBegin, nEnd);
    T6(:,nBegin:nEnd) = K(nBegin:nEnd,:)';
    nBegin = nEnd+1;    
end

clear K;
save(outfile,'-v7.3','T6');

toc 
