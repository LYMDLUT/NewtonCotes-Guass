clear
x_1=0;%积分起始点
x_n_1=2;%积分结束点

for n=1:20
h=(x_n_1-x_1)/n;

inegral = 0;
for k = 0:n
Cnk = xishu(n,k);
x_k =x_1 + h*k;
inegral = inegral + Cnk*FX(x_k);
end

acc=20;%输出结果的有效位数
cal = vpa(inegral*(x_n_1-x_1),acc);%计算值

syms x1;
fx1 =FX(x1);
ref = vpa(int(fx1,x1,x_1,x_n_1),acc);%利用matlab积分算得高精度参考值
fprintf('n=%d,预测值:%.20f,相对误差:%.20f\n',n,cal,abs((cal - ref)/ref))
end

function fx=FX(x)
%fx = x^2*cos(x);%公式x^2*cos(x)
fx = 1/(x^2+1);%公式1/(x^2+1)
end
