%transpose V(1:300000,:) ans assign to VT1
% must load validation first

nUsers=1000990;  
nItems=624961;  

outfile='vt1.mat';  % transpose V ans assign to VT1

VT1 = sparse(nUsers, nItems); % use this if out of memory
nBlocks = 99; 


nPART1 = 300000;

tic

nBegin = 1;
while (nBegin <= nPART1)
    nEnd = min(nBegin+nBlocks, nPART1);
    fprintf('Copying from: %d, to: %d \n', nBegin, nEnd);
    VT1(:,nBegin:nEnd) = V(nBegin:nEnd,:)';
    nBegin = nEnd+1;    
end

toc  

clear V;

save(outfile,'-v7.3','VT1');
