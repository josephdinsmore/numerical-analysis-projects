function theta_2 = rk4pend(h,alpha)

N = 100/h;
t = 0:h:100;

w(1,:) = alpha(:)';

for i = 1:N
    k1 = h*fpend(w(i,:));
    k2 = h*fpend(w(i,:) + k1/2);
    k3 = h*fpend(w(i,:) + k2/2);
    k4 = h*fpend(w(i,:) + k3);
    w(i+1,:) = w(i,:) + (k1 + 2*k2 + 2*k3 + k4)/6;
    y = w(i,:) + (k1 + 2*k2 + 2*k3 + k4)/6;
end
plot(t, w(:,2));
xlabel('t');
ylabel('\theta_2');
theta_2 = y(2);
end