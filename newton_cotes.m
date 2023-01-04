x_1=-1;
x_n_1=1;

for n=1:20
h=(x_n_1-x_1)/n;


inegral = 0;
for k = 0:n
Cnk = xishu(n,k);
x_k =x_1 + h*k;
inegral = inegral + Cnk*1/(x_k^2+1);
end

acc=20;
cal = vpa(inegral*(x_n_1-x_1),acc);

syms x1;
ref = vpa(int(1/(x1^2+1),x1,x_1,x_n_1),acc);
fprintf('%d:%.20f\n',n, abs((cal - ref)/ref))
end