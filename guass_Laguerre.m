x_1=0;
x_n_1=inf;
n=5;

[A,B] = Guass_Laguerre_Z(n);
I = 0;
for i=1:n+1
    x = A(i);
    fx = sin(x);
    I = I + fx * B(i);
end

acc = 20;
cal = vpa(I,acc)
syms t;
ref = vpa(int(exp(-t)*sin(t),t,x_1,x_n_1),acc);
fprintf('%d:%.20f\n',n, abs((cal - ref)/ref))