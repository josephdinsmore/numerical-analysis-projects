f = @(time) splineeval(t, ay, by, cy, dy, time) - 1.2;
df = @(time) diffsplineeval(t, ay, by, cy, dy, time);

t1 = newton(f, df, 2.5, 1e-15);
t2 = newton(f, df, 4.5, 1e-15);

fprintf('t1 %.8f\n', t1);
fprintf('t2 %.8f\n', t2);