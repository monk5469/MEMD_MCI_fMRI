function A=Standardization(a)
for m=1:116
    for n=1:116
       A(m,n)= 2*(a(m,n)-min(min(a)))/(max(max(a))-min(min(a)))-1;
    end
end
end