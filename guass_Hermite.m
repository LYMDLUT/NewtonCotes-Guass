x_1=-inf;
x_n_1=inf;
n=2;

[A,B] = Guass_Hermite_Z(n);
I = 0;
for i=1:n+1
    x = A(i);
    fx = FX(x);
    I = I + fx * B(i);
end

acc = 20;
cal = vpa(I,acc);
syms t;
fx2 =FX(t);
ref = vpa(int(exp(-t^2)*fx2,t,x_1,x_n_1),acc);
fprintf('%d:%.20f\n',n, abs((cal - ref)/ref))

function fx=FX(x)
%fx = x^2*cos(x);
%fx = 1/(x^2+1);
%fx = sin(x);
fx = x^2;
end