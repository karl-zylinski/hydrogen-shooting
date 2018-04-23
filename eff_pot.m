function [V] = eff_pot(r, l)
    V = (l*(l + 1))./(2*r.^2) - 1./r;
end