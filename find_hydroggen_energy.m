% Finds the energy for the hydrogen atom for specified orbital angular momentum.
function found_energy = find_hydroggen_energy(orbital_ang_momentum, r_start, r_end)
slope_start = 0.001;
y_start = 0;
cur_energy = -0.05;
step = -0.1;
num_flips = 40;
cur_div_sign = -1;

% This loop uses the shooting method to find the energy "scanning" through
% differnt energies and reversing the scan direction whenever the
% divergence flips sign.
for i = 1:num_flips
    cur_energy = cur_energy + step;
    [left_r, left_u] = ode45(@(r, y)radial_schroedinger(r, y, orbital_ang_momentum, cur_energy), [r_start r_end], [y_start slope_start]);
    end_sign = sign(left_u(end));
    if end_sign ~= cur_div_sign
        step = -step / 2;
        cur_div_sign = -cur_div_sign;
    end
end

found_energy = cur_energy;