x_1=0;%������ʼ��
x_n_1=inf;%���ֽ�����

for n=0:19%n��0��19
[A,B] = Guass_Laguerre_Z(n);%��x_k��A_k
I = 0;
for i=1:n+1
    x = A(i);
    fx = FX(x);
    I = I + fx * B(i);
end

acc = 20;%����������Чλ��
cal = vpa(I,acc);%����ֵ
syms t;
fx2 =FX(t);
ref = vpa(int(exp(-t)*fx2,t,x_1,x_n_1),acc)%����matlab������ø߾��Ȳο�ֵ
fprintf('n=%d,Ԥ��ֵ:%.20f,������:%.20f\n',n,cal,abs((cal - ref)/ref))
end

function fx=FX(x)
fx = sin(x);%��ʽ
end