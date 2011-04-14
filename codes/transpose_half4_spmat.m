nUsers=1000990;  
nItems=624961;  

outfile='transpose4.mat';  % transpose K ans assign to T

T4 = sparse(nUsers, nItems); % use this if out of memory
nBlocks = 99; 

nPART3 = 300000;
nPART4 = 400000;
tic

nBegin = nPART3+1;
while (nBegin <= nPART4)
    nEnd = min(nBegin+nBlocks, nPART4);
    fprintf('Copying from: %d, to: %d \n', nBegin, nEnd);
    T4(:,nBegin:nEnd) = K(nBegin:nEnd,:)';
    nBegin = nEnd+1;    
end

toc  

clear K;
save(outfile,'-v7.3','T4');
