clear
x_1=0;%������ʼ��
x_n_1=2;%���ֽ�����

for n=0:19
[A,B] = Guass_Legendre_Z(n);%��x_k��A_k
I = 0;
for i=1:n+1
    x = (x_n_1 - x_1)*A(i)/2 + (x_n_1 + x_1)/2;
    fx = (x_n_1 - x_1)/2 * FX(x);
    I = I + fx * B(i);
end

acc = 20;%����������Чλ��
cal = vpa(I,acc);%����ֵ
syms t;
fx2 = FX(t);
ref = vpa(int(fx2,t,x_1,x_n_1),acc)%����matlab������ø߾��Ȳο�ֵ
fprintf('n=%d,Ԥ��ֵ:%.20f,������:%.20f\n',n,cal,abs((cal - ref)/ref))
end

function fx=FX(x)
%fx = x^2*cos(x);%��ʽx^2*cos(x)
fx = 1/(x^2+1);%��ʽ1/(x^2+1)
end