function X=addhead(A)
a=ones(1, 116)*1;
x=mat2cell(A,a,a);
for i=1:116
    name=['R',num2str(i)];
    AAL{i}=name;
end
for i=1:116
    name=['R',num2str(i)];
    T{i+1,1}=name;
end
X=[AAL;x];
X=[T,X];
end


