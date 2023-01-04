function p=Guass_Hermite_n_1(x,n)
if n==0
    p = 1;
elseif n==1
    p = 2*x;
else
    p=(2*x)*Guass_Hermite_n_1(x,(n-1)) - (2*(n-1))*Guass_Hermite_n_1(x,(n-2));
end
end
