clear all;

orbital_ang_momentum = 1;
r_end = 5000;
r = 1:0.0001:r_end;
V = eff_pot(r,1);
figure(1);
clf;
plot(r, V);
[min_V, min_V_idx] = min(V);
r_V_min = r(min_V_idx);

r_start = 0.000001;
E = 13.6;
[left_r, left_u] = rk4(@(r, y)radial_schroedinger(r, y, orbital_ang_momentum, E), [0; 0.0001], [r_start; r_V_min], 1000);
left_R = left_u(1, :)./left_r;
figure(2);
clf;
plot(left_r, left_R);

% for E = 1:13.6
%     [left_r, left_y] = ode45(@(r, y)radial_schroedinger(r, y, orbital_ang_momentum, E), [0.000001, r_end], [0, 0.0000001]);
%     
%     if (abs(left_y(end, 1)) < 0.00000001 && abs(left_y(end, 2)) < 0.00000001) 
%         figure(2);
%         clf;
%         plot(left_r, left_y(:, 1));
%         break;
%     end
% end
%E = 1;
% 
% 
% E = 1;
% r_start = 0.000001;
% [left_r, left_u] = rk4(@(r, y)radial_schroedinger(r, y, orbital_ang_momentum, E), [0; 0.0001], [r_start; r_V_min], 1000);
% [right_r, right_u] = rk4(@(r, y)radial_schroedinger_backwards(r, y, orbital_ang_momentum, E), [0; 0.0001], [r_end; r_V_min], 1000);
% % 
% figure(2);
% clf;
% plot(left_r, left_u(1, :)./left_r);
% hold on;
% plot(right_r, right_u(1, :)./right_r);