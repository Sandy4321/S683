%transpose V(300000:end,:) ans assign to VT2
% must load validation first

nUsers=1000990;  
nItems=624961;  

outfile='vt2.mat';  % 

nBlocks = 99; 

nPART1 = 300000;

tic

VT2 = sparse(nUsers, nItems); % use this if out of memory

nBegin = nPART1+1;
while (nBegin <= nItems)
    nEnd = min(nBegin+nBlocks, nItems);
    fprintf('Copying from: %d, to: %d \n', nBegin, nEnd);
    VT2(:,nBegin:nEnd) = V(nBegin:nEnd,:)';
    nBegin = nEnd+1;    
end

clear V;
save(outfile,'-v7.3','VT2');

toc 
