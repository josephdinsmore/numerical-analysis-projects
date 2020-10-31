t= [0,   1,   2,   3,   4,   5  ];
x= [1.0, 1.5, 2.0, 2.0, 2.5, 2.5];
y= [1.0, 0.5, 1.0, 1.5, 1.5, 1.0];

[bx, cx, dx]= ncspline(t, x);
[by, cy, dy]= ncspline(t, y);

A= [0:5; t; x; bx,0; cx,0; dx,0]';
B= [0:5; t; y; by,0; cy,0; dy,0]';

fprintf('j           t_j            a_j            b_j            c_j          d_j\n');
fprintf('--------------------------------------------------------------------------------\n');
fprintf('%4f    %4f       %4f       %4f       %4f     %4f\n', A.');

time=0:0.01:5;

xx = splineeval(t, x, bx, cx, dx, time);
yy = splineeval(t, y, by, cy, dy, time);

plot(xx,yy, x,y,'o'), axis equal, grid on