function [Result1,Result2]=Guass_Legendre_Z(n)
%---------------------------------------------------------------------------------------
%Guass_Legendre_Z����˼����n+1�����õ¶���ʽ����㡣
%�������õ¶���ʽ����
%�����Ӧ���õ¶���ʽ���(Ҳ���Խи�˹��)Result1�͸�˹���Ӧ�ĸ�˹ϵ��Result2
%������Ϊ��������
%---------------------------------------------------------------------------------------
syms x;
p=sym2poly((x^2-1)^(n+1)); %����ʽ��n+1����ת��Ϊ���󷽱����
for i=1:n+1
p=polyder(p);
end
pn=p./(factorial(n+1)*2^(n+1));%��ȫ�����õ����õ¶���ʽ
Result1=sort(roots(pn));
Result2=[];%Ԥ�ȿ���һ���ռ�
N=n+1;%����ѭ��
a(1:N)=1;%Ԥ�ȿ���һ���ռ�
%ѭ������ÿ����˹ϵ��Ak
for i=1:1:N
    b(x)=0*x+1;
    switch i
        case i==1
            for j=2:N
                a(i)=(Result1(i)-Result1(j))*a(i); %a(i)�Ƿ�ĸ�ϵģ��������Ͽ��ǳ���
                b(x)=(x-Result1(j))*b(x);
            end%b(x)�Ƿ����ϵģ��������Ͽ���x�Ķ���ʽ
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
    Result2(i)=int(b(x),x,-1,1)/a(i);%��˹ϵ����ʽ
end
% Result1=vpa(Result1,20);
% Result2=vpa(Result2,20);
% for i =1:length(Result1) 
% fprintf('%d:%.16f\n',i,Result1(i))
% fprintf('%d:%.16f\n',i,Result2(i))
end