clear
x_1=0;%积分起始点
x_n_1=2;%积分结束点

for n=0:19
[A,B] = Guass_Legendre_Z(n);%求x_k和A_k
I = 0;
for i=1:n+1
    x = (x_n_1 - x_1)*A(i)/2 + (x_n_1 + x_1)/2;
    fx = (x_n_1 - x_1)/2 * FX(x);
    I = I + fx * B(i);
end

acc = 20;%输出结果的有效位数
cal = vpa(I,acc);%计算值
syms t;
fx2 = FX(t);
ref = vpa(int(fx2,t,x_1,x_n_1),acc)%利用matlab积分算得高精度参考值
fprintf('n=%d,预测值:%.20f,相对误差:%.20f\n',n,cal,abs((cal - ref)/ref))
end

function fx=FX(x)
%fx = x^2*cos(x);%公式x^2*cos(x)
fx = 1/(x^2+1);%公式1/(x^2+1)
end