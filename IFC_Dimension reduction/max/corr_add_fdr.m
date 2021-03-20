% This function removes the points by FDR, i.e. setting to 'NaN'
function A=corr_add_fdr(a,b)

Th=0.05;% This value can be re-set, here is 0.05
[m n]=find(b>Th);
    for i=1:size(m)
        a(m(i,1),n(i,1))=NaN;
    end
A=a;
end