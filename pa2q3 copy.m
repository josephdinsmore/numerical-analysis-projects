L = zeros(5,1);
j = 1;
nlist = [16 32 64 128 10000];

for n = nlist
    h = (t2 - t1) / n;
    time = t1:h:t2;
    xprime = diffsplineeval(t, x, bx, cx, dx, time);
    yprime = diffsplineeval(t, y, by, cy, dy, time);
    g = sqrt(xprime.^2 + yprime.^2);
    AL=0;
    for i = 1:(length(time)-2)
        AL = AL + (2 * g(i + 1));
    end
    AL = (h/2) * (g(1) + AL + g(length(time)));
    L(j,1) = AL;
    j = j + 1;
end

fprintf('n: %4i           %4i            %4i            %4i             %4i\n', nlist);
fprintf('L:   %.8f     %.8f      %.8f     %.8f      %.8f\n', L');

errors = [];
hlist = [];

for k = 1:4
    errors(k) = abs(L(k,1) - L(5,1));
    hlist(k) = (t2 - t1) / nlist(k);
end

loglog(hlist, errors, 'o-'), grid on;
xlabel('h');
ylabel('Error');
slope = (log(errors(4)) - log(errors(3))) / (log(hlist(4)) - log(hlist(3)));

fprintf('slope %.8f\n', slope);