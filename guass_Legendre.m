x_1=0;
x_n_1=pi/2;
n=3;

[A,B] = Guass_Legendre_Z(n);
I = 0;
for i=1:n+1
    x = (x_n_1 - x_1)*A(i)/2 + (x_n_1 + x_1)/2;
    fx = (x_n_1 - x_1)/2 * FX(x);
    I = I + fx * B(i);
end

acc = 20;
cal = vpa(I,acc);
syms t;
fx2 = FX(t);
ref = vpa(int(fx2,t,x_1,x_n_1),acc);
fprintf('%d:%.20f\n',n, abs((cal - ref)/ref))

function fx=FX(x)
%fx = x^2*cos(x);
fx = 1/(x^2+1);
end