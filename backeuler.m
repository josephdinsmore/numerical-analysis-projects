function [t,w] = backeuler(f, dfdy, a, b, alpha, N, maxiter, tol)

h = (b-a) / N;
t = a:h:b;
w(1) = alpha;

for i = 1:N
    guess = w(i);
    wiplus1 = guess;
    iter = 0;
    while 1
        if (maxiter < iter), error("maxiterexceeded"); end
        
        wiplus1 = guess - (guess - w(i) - (h*f(t(i+1),guess))) / (1 - h*dfdy(t(i+1),guess));
        if abs(guess-wiplus1) < tol, break; end
        guess = wiplus1;
        iter = iter + 1;
    end
    
    w(i+1) = wiplus1;
end