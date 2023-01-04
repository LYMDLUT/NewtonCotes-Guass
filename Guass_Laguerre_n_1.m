function p=Guass_Laguerre_n_1(x,n)
if n==0
    p = 1;
elseif n==1
    p = 1-x;
else
    p=((2*n - 1-x)*Guass_Laguerre_n_1(x,(n-1)) - (n-1)*Guass_Laguerre_n_1(x,n-2))/(n);
end
end