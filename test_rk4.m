clear all;

c = 0.00081;
g = 9.82;
w = 5;

[t, y] = rk4(@(t,y)kanon_ode(t,y, g, w, c, 0), [0; 0; 200; 200], [0 50], 10000);

plot(t, y(2, :));