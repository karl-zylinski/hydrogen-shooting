clear all;
close all;

r_start = 0.00000001;
r_end = 30;
au_eV_conv = 27.211385;
energy_l0 = find_hydroggen_energy(0, r_start, r_end);
energy_l1 = find_hydroggen_energy(1, r_start, r_end);
energy_l2 = find_hydroggen_energy(2, r_start, r_end);
disp(['Found energy for l=0: ' num2str(energy_l0 * au_eV_conv, 3) ' eV']);
disp(['Found energy for l=1: ' num2str(energy_l1 * au_eV_conv, 3) ' eV']);
disp(['Found energy for l=2: ' num2str(energy_l2 * au_eV_conv, 3) ' eV']);

energies_l0 = linspace(energy_l0-abs(energy_l0)/10, energy_l0+abs(energy_l0)/10, 7);
figure(1);
for i = 1:length(energies_l0)
    E = energies_l0(i);
    [left_r, left_u] = ode45(@(r, y)radial_schroedinger(r, y, 0, E), [r_start r_end], [0 0.001]);
    plot(left_r, left_u(:, 1)./left_r);
    hold on;
end
xlabel('Atomic radial postition');
ylabel('Wave function');
title('Non-nomalised wavefunction for l = 0'); 
legend(cellstr(num2str(energies_l0', 'E=%.5f')), 'location', 'southwest');
axis([0 23 -20 20]);

energies_l1 = linspace(energy_l1-abs(energy_l1)/10, energy_l1+abs(energy_l1)/10, 7);
figure(2);
for i = 1:length(energies_l1)
    E = energies_l1(i);
    [left_r, left_u] = ode45(@(r, y)radial_schroedinger(r, y, 1, E), [r_start r_end], [0 0.001]);
    plot(left_r, left_u(:, 1)./left_r);
    hold on;
end
xlabel('Atomic radial postition');
ylabel('Wave function');
title('Non-nomalised wavefunction for l = 1'); 
legend(cellstr(num2str(energies_l1', 'E=%.5f')), 'location', 'southwest');
axis([0 23 -30000 30000]);

energies_l2 = linspace(energy_l2-abs(energy_l2)/10, energy_l2+abs(energy_l2)/10, 7);
figure(3);
for i = 1:length(energies_l2)
    E = energies_l2(i);
    [left_r, left_u] = ode45(@(r, y)radial_schroedinger(r, y, 2, E), [r_start r_end], [0 0.001]);
    plot(left_r, left_u(:, 1)./left_r);
    hold on;
end
xlabel('Atomic radial postition');
ylabel('Wave function');
title('Non-nomalised wavefunction for l = 2'); 
legend(cellstr(num2str(energies_l2', 'E=%.5f')), 'location', 'southwest');
axis([0 30 -1.5*10^13 1.5*10^13]);