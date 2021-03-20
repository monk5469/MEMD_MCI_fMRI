
% This function return values by FDR

function qval=getFDR(p);
pDim=length(p);
lo=1;
for m=1:pDim
    for n=m+1:pDim
            p1(lo,1)=p(m,n);
            lo=1+lo;
    end
end
q=mafdr(p1);% FDR correction

y=zeros(pDim,pDim);
lo=1;
for m=1:pDim
    for n=m+1:pDim
            y(m,n)=q(lo,1);
            lo=1+lo;
    end
end
qval=y+y'+eye(pDim);

% qval(find(qval<0.05))=0;
% qval(find(qval>=0.05))=5;

end
