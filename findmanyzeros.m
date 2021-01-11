function p = findmanyzeros(f, a, b, n, tol)
x=a+(b-a)*(0:n)/n;
fx=f(x);

p=[];

for k=1:n
    if sign(fx(k))~=sign(fx(k+1))
        p(end+1)=findzero(f,x(k),f(k+1),tol);
    end
end