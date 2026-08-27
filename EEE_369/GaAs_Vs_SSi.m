%% 3.3 - Comparing conduction-band curvature

clear; close all; clc;

k = linspace(-1,1,500);

% Larger curvature = smaller effective mass
E_GaAs = 1 + 1.2*k.^2;

% Smaller curvature = larger effective mass
E_Si = 1 + 0.55*k.^2;

figure('Color','w');

plot(k,E_GaAs,'LineWidth',2); hold on;
plot(k,E_Si,'LineWidth',2);

grid on;
box on;

xlabel('k');
ylabel('Energy, E');
title('Conduction-Band Curvature: GaAs vs Silicon');

legend('GaAs: larger curvature','Si: smaller curvature', ...
       'Location','northwest');

text(-0.95,1.9,'Larger curvature');
text(-0.95,1.65,'\rightarrow smaller m^*');

hold off;