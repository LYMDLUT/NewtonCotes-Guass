function [Result1,Result2]=Guass_Legendre_Z(n)
%---------------------------------------------------------------------------------------
%Guass_Legendre_Z，意思是求n+1次勒让德多项式的零点。

%输入勒让德多项式次数

%输出对应勒让德多项式零点(也可以叫高斯点)Result1和高斯点对应的高斯系数Result2

%输出结果为两个数组
%---------------------------------------------------------------------------------------
syms x;
p=sym2poly((x^2-1)^(n+1)); %多项式的n+1次幂转化为矩阵方便计算
for i=1:n+1
p=polyder(p);
end
pn=p./(factorial(n+1)*2^(n+1));%完全构建好的勒让德多项式
Result1=sort(roots(pn));
Result2=[];%预先开好一个空集
N=n+1;%方便循环
a(1:N)=1;%预先开好一个空集
%循环计算每个高斯系数Ak
for i=1:1:N
    b(x)=0*x+1;
    switch i
        case i==1
            for j=2:N
                a(i)=(Result1(i)-Result1(j))*a(i); %a(i)是分母上的，且总体上看是常数
                b(x)=(x-Result1(j))*b(x);
            end%b(x)是分子上的，且总体上看是x的多项式
        case i==N
            for j=1:i-1
                a(i)=(Result1(i)-Result1(j))*a(i);
                b(x)=(x-Result1(j))*b(x);
            end
        otherwise
            for j=[1:(i-1),(i+1):N]
                a(i)=(Result1(i)-Result1(j))*a(i);
                b(x)=(x-Result1(j))*b(x);
            end
    end
    Result2(i)=int(b(x),x,-1,1)/a(i);%高斯系数公式
end
end