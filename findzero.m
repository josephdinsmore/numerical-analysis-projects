function p = findzero(f, a, b, tol)

% Print header
fprintf(' n         a             b             p           f(p)    \n');
fprintf('-----------------------------------------------------------\n');

w=1;
for n = 1:100 % Terminate after 100 iterations (even if not converged) (givens)
    p=a+w*f(a)*(a-b)/(f(b)-w*f(a)); %1.
    fprintf('%2d  %12.8f  %12.8f  %12.8f  %12.8f\n', n, a, b, p, f(p)); %2.
    if f(p)*f(b) > 0
        w=1/2;
    else
        w=1;
        a=b;
    end %3.
    b=p; %4.
    if abs(b-a)<tol | abs(f(p))<tol, break;
    end %5.
end