function Cnk=xishu(n,k)

Ckn_xishu=(-1)^(n-k)/(n * factorial(k) * factorial(n-k));

syms x;
fx = 1;
for i=0:n
fx = fx * (x-i);
end
fx = fx / (x-k);
Ckn_jifen=int(fx, x, 0, n);

Cnk = Ckn_xishu * Ckn_jifen;
end