clear all;
clf;
c = 0.00081;
g = 9.82;
w = 5;

[t_nores, y_nores] = ode45(@(t,y)kanon_ode(t,y, g, w, c, 0), [0, 50], [0; 0; 200; 200]);

plot(y_nores(:, 1), y_nores(:, 2));
hold on;

[t, y] = ode45(@(t,y)kanon_ode(t,y, g, w, c, 1), [0, 50], [0; 0; 200; 200]);

plot(y(:, 1), y(:, 2));

k = 1;
v_0 = [0; 0; 200; 200];
v_i = v_0;
v = [v_i];
t = [];
for i = 1:50
    v_i = v(1:4, i);
    v(1:4, i+1) = v_i + k*kanon_ode(t, v_i, g, w, c, 0);
end

hold on;
plot(v(1, :), v(2, :), 'g');
