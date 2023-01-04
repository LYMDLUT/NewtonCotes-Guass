function [Result1,Result2]=Guass_Laguerre_Z(n)
%---------------------------------------------------------------------------------------
%LZ.m为legendreZero的简写，意思是求n+1次勒让德多项式的零点。

%输入Laguerre多项式次数

%输出对应Laguerre多项式零点(也可以叫高斯点)Result1和高斯点对应的高斯系数Result2

%输出结果为两个数组
%---------------------------------------------------------------------------------------
syms x;
p = Guass_Laguerre_n_1(x,n+1);
pn = sym2poly(p);
Result1=sort(roots(pn));
Result2=[];
for i=1:n+1
    Result2(i) = Result1(i)/((n+2)^2*Guass_Laguerre_n_1(Result1(i),n+2)^2);
end
end