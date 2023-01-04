x_1=0;
x_n_1=pi/2;
n=19;

[A,B] = Guass_Legendre_Z(n);
I = 0;
for i=1:n+1
    x = (x_n_1 - x_1)*A(i)/2 + (x_n_1 + x_1)/2;
    fx = (x_n_1 - x_1)/2 * x^2*cos(x);
    I = I + fx * B(i);
end

acc = 20;
cal = vpa(I,acc);
syms t;
ref = vpa(int(t^2*cos(t),t,x_1,x_n_1),acc);
fprintf('%d:%.20f\n',n, abs((cal - ref)/ref))