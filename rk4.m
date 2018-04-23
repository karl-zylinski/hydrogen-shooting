function [t_rk4, y_rk4] = rk4(f, initial, range, N)

k = (range(2) - range(1))/N;
t_rk4 = range(1):k:range(2);
y_rk4 = initial;

for i = 1:N
    t = t_rk4(i);
    y = y_rk4(:, i);
    w1 = f(t, y);
    w2 = f(t+k/2, y+(k/2)*w1);
    w3 = f(t+k/2, y+(k/2)*w2);
    w4 = f(t+k, y+k*w3);
    y_rk4(:, i+1) = y + (k/6)*(w1 + 2*w2 + 2*w3 + w4); 
end