clear all;
close all;

orbital_ang_momentum = 1;
r_end = 30;
r = 0.01:0.00001:r_end;
r_start = 0.000001;
cur_energy = -0.05;
step = -0.1;
num_flips = 4000;
cur_div_sign = -1;

for i = 1:num_flips
    cur_energy = cur_energy + step;
    [left_r, left_u] = ode45(@(r, y)radial_schroedinger(r, y, orbital_ang_momentum, cur_energy), [r_start r_end], [0 0.0001]);
    end_sign = sign(left_u(end));
    if end_sign ~= cur_div_sign
        step = -step / 2;
        cur_div_sign = -cur_div_sign;
    end
end

found_energy = cur_energy;
energies = linspace(found_energy-abs(found_energy)/10, found_energy+abs(found_energy)/10, 11);

for i = 1:length(energies)
    E = energies(i);
    [left_r, left_u] = ode45(@(r, y)radial_schroedinger(r, y, orbital_ang_momentum, E), [r_start r_end], [0 0.0001]);
    plot(left_r, left_u(:, 1)./left_r);
    hold on;
end

legend(cellstr(num2str(energies', 'E=%.0010f')), 'location', 'southwest');
axis([0 30 -20 20]);