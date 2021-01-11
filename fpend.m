function ydot = fpend(y)

theta_1 = y(1);
theta_2 = y(2);

omega_1 = y(3);
omega_2 = y(4);

dtheta_1 = omega_1;
dtheta_2 = omega_2;

domega_1 = (-3*sin(theta_1) - sin(theta_1-2*theta_2) - 2*sin(theta_1-theta_2) * (omega_2^2+omega_1^2*cos(theta_1-theta_2))) / (3-cos(2*theta_1-2*theta_2));
domega_2 = (2 * sin(theta_1-theta_2) * (2*(omega_1^2) + 2*cos(theta_1) + (omega_2^2) * cos(theta_1-theta_2))) / (3-cos(2*theta_1-2*theta_2));

ydot = [dtheta_1,dtheta_2,domega_1,domega_2];
end