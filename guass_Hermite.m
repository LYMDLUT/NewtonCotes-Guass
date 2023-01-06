x_1=-inf;%积分起始点
x_n_1=inf;%积分结束点

for n=1:19
[A,B] = Guass_Hermite_Z(n);%求x_k和A_k
I = 0;
for i=1:n+1
    x = A(i);
    fx = FX(x);
    I = I + fx * B(i);
end

acc = 20;%输出结果的有效位数
cal = vpa(I,acc);%计算值
syms t;
fx2 =FX(t);
ref = vpa(int(exp(-t^2)*fx2,t,x_1,x_n_1),acc);%利用matlab积分算得高精度参考值
fprintf('n=%d,预测值:%.20f,相对误差:%.20f\n',n,cal,abs((cal - ref)/ref))
end

function fx=FX(x)
fx = x^2;
end