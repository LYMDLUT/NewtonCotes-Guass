function [Result1,Result2]=Guass_Hermite_Z(n)
%---------------------------------------------------------------------------------------
%����Hermite����ʽ����
%�����ӦHermite����ʽ���(Ҳ���Խи�˹��)Result1�͸�˹���Ӧ�ĸ�˹ϵ��Result2
%������Ϊ��������
%---------------------------------------------------------------------------------------
syms x;
p = Guass_Hermite_n_1(x,n+1);
pn = sym2poly(p);
Result1=sort(roots(pn));
Result2=[];
for i=1:n+1
    Result2(i) = factorial(n+1)*sqrt(pi)*2^(n+2)/(2*(n+1)*Guass_Hermite_n_1(Result1(i),n))^2;
end
% Result1=vpa(Result1,40);
% Result2=vpa(Result2,40);
% for i =1:length(Result1) 
% fprintf('%d:%.31f\n',i,Result1(i))
% fprintf('%d:%.31f\n',i,Result2(i))
end