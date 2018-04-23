function y_out = radial_schroedinger(r, y, orbital_ang_momentum, E)
y_out(1, 1) = y(2);
y_out(2, 1) = 2*(eff_pot(r, orbital_ang_momentum) - E)*y(1);
end