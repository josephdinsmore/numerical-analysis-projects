function pa3q3() 
alpha = [1 1 0 0];
h = [0.05 0.025 0.0125 0.00625];
errors = zeros(4, 1);
theta_2 = zeros(4, 1);
actual = rk4pend(0.001,alpha);

for i = 1:4
    theta_2(i) = rk4pend(h(i),alpha);
    errors(i) = abs(actual-theta_2(i));
end

xlabel('h');
ylabel('Error')
grid on
loglog(h, errors)