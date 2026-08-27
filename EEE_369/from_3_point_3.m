%% 3.3 - The complete mental picture

clear; close all; clc;

k = linspace(-2,2,500);

% Direct: extrema at same k
Ev_D = 0.5 - 0.35*k.^2;
Ec_D = 1.7 + 0.65*k.^2;

% Indirect: conduction minimum shifted
Ev_I = 0.5 - 0.35*k.^2;
Ec_I = 1.7 + 0.65*(k-0.9).^2;

figure('Color','w');

subplot(1,2,1);
plot(k,Ev_D,'LineWidth',2); hold on;
plot(k,Ec_D,'LineWidth',2);
grid on; box on;
xlabel('k');
ylabel('Energy');
title('GaAs: DIRECT');
text(-1.7,1.0,'k_c = k_v');
hold off;

subplot(1,2,2);
plot(k,Ev_I,'LineWidth',2); hold on;
plot(k,Ec_I,'LineWidth',2);
grid on; box on;
xlabel('k');
ylabel('Energy');
title('Si: INDIRECT');
text(-1.7,1.0,'k_c \neq k_v');
hold off;

sgtitle('Section 3.3 — Direct vs Indirect Bandgap');