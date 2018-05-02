clear all;
close all;

orbital_ang_momentum = 1;
r_end = 30;
r = 0.01:0.00001:r_end;
r_start = 0.000001;

energies = -0.12:-0.001:-0.13;

for i = 1:length(energies)
    E = energies(i);
    [left_r, left_u] = ode45(@(r, y)radial_schroedinger(r, y, orbital_ang_momentum, E), [r_start r_end], [0 0.0001]);
    plot(left_r, left_u(:, 1)./left_r);
    hold on;
end

legend(cellstr(num2str(energies', 'E=%.0003f')), 'location', 'southwest');
axis([0 30 -20 20]);