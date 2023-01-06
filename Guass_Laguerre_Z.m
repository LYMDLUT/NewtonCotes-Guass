function [Result1,Result2]=Guass_Laguerre_Z(n)
%---------------------------------------------------------------------------------------
%LZ.mΪlegendreZero�ļ�д����˼����n+1�����õ¶���ʽ����㡣
%����Laguerre����ʽ����
%�����ӦLaguerre����ʽ���(Ҳ���Խи�˹��)Result1�͸�˹���Ӧ�ĸ�˹ϵ��Result2
%������Ϊ��������
%---------------------------------------------------------------------------------------
syms x;
p = Guass_Laguerre_n_1(x,n+1);
pn = sym2poly(p);
Result1=sort(roots(pn));
Result2=[];
for i=1:n+1
    Result2(i) = Result1(i)/((n+2)^2*Guass_Laguerre_n_1(Result1(i),n+2)^2);
end
% Result1=vpa(Result1,30);
% Result2=vpa(Result2,30);
% for i =1:length(Result1) 
% fprintf('%d:%.25f\n',i,Result1(i))
% fprintf('%d:%.25f\n',i,Result2(i))
end