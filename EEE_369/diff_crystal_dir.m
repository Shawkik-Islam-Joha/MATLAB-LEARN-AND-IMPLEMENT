%% 3.3 - E-k curves in different crystal directions

clear; close all; clc;

k = linspace(-2,2,500);

E100 = 1 + 0.70*k.^2;
E110 = 1 + 0.45*k.^2;
E111 = 1 + 0.90*k.^2;

figure('Color','w');

plot(k,E100,'LineWidth',2); hold on;
plot(k,E110,'LineWidth',2);
plot(k,E111,'LineWidth',2);

grid on;
box on;

xlabel('k');
ylabel('Energy, E');
title('E-k Curves Along Different Crystal Directions');

legend('[100]','[110]','[111]','Location','northwest');

hold off;