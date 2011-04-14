nUsers=1000990;  
nItems=624961;  

outfile='transpose5.mat';  % transpose K ans assign to T

T5 = sparse(nUsers, nItems); % use this if out of memory

nBlocks = 99; 

nPART4 = 400000;
nPART5 = 500000;

tic

nBegin = nPART4+1;
while (nBegin <= nPART5)
    nEnd = min(nBegin+nBlocks, nPART5);
    fprintf('Copying from: %d, to: %d \n', nBegin, nEnd);
    T5(:,nBegin:nEnd) = K(nBegin:nEnd,:)';
    nBegin = nEnd+1;    
end

toc  

clear K;
save(outfile,'-v7.3','T5');
