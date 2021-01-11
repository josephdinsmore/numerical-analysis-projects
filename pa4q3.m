f= @(t,y)  (y^2)*(1-y);
df= @(t,y) (2*y) - 3*(y^2);

a = 0;
b = 2000;
alpha = 0.9; tol = 1e-12;
%[t2,w2] = rk4(f, a, b, alpha, N);
[t1,w1]= rk4(f, a, b, alpha, 648);
[t2,w2]= rk4(f, a, b, alpha, 791);

disp("lower" + w1(length(w1)));
disp("upper" + w2(length(w2)));
plot(t1,w1,t2,w2)
legend('<N','>N')