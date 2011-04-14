nUsers=1000990;  
nItems=624961;  

outfile='transpose3.mat';  % transpose K ans assign to T

T3 = sparse(nUsers, nItems); % use this if out of memory
nBlocks = 99; 

nPART2 = 200000;
nPART3 = 300000;

tic

nBegin = nPART2+1;
while (nBegin <= nPART3)
    nEnd = min(nBegin+nBlocks, nPART3);
    fprintf('Copying from: %d, to: %d \n', nBegin, nEnd);
    T3(:,nBegin:nEnd) = K(nBegin:nEnd,:)';
    nBegin = nEnd+1;    
end

toc  

clear K;
save(outfile,'-v7.3','T3');
