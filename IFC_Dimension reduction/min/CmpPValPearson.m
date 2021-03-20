
% This function returns values of p for Pearson correlation matrix.

function pval=CmpPValPearson(coef,n);
% coef: a Pearson correlation matrix for a n*pi time series matrix
% n: the time points of a time series
p1=size(coef);
pval = zeros(p1);
ltri = (tril(ones(size(pval)),-1) > 0); % lower triangle only, no diagonal
tail='b';
pval(ltri) = pvalPearson(tail, coef(ltri), n);
pval = pval + pval';
pval(1:p1+1:end) = sign(diag(coef)); % preserve NaNs on diag

function p = pvalPearson(tail, rho, n)
% tail
% case 'b' % 'both or 'ne'
% case 'r' % 'right' or 'gt'
% case 'l' % 'left' or 'lt'

%PVALPEARSON Tail probability for Pearson's linear correlation.
t = rho.*sqrt((n-2)./(1-rho.^2)); % +/- Inf where rho == 1
switch tail
case 'b' % 'both or 'ne'
    p = 2*tcdf(-abs(t),n-2);
case 'r' % 'right' or 'gt'
    p = tcdf(-t,n-2);
case 'l' % 'left' or 'lt'
    p = tcdf(t,n-2);
end