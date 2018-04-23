clear all;

orbital_ang_momentum = 1;
r_end = 4;
r = 1:0.0001:r_end;
V = eff_pot(r,1);
figure(1);
clf;
plot(r, V);

r_start = 0.000001;
step_size = 0.01;
E = 1337;
[r, u] = rk4(@(r, y)radial_schroedinger(r, y, orbital_ang_momentum, E), [0; 0.0001], [r_start; r_end], (r_end-r_start)/step_size);
R = u(1, :);
figure(2);
clf;
plot(r, R);