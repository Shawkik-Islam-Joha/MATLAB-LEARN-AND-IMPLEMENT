%% GaAs - conceptual direct bandgap E-k diagram

clear; close all; clc;

k = linspace(-2,2,500);

% Valence band maximum at k = 0
Ev = 0.6 - 0.35*k.^2;

% Conduction band minimum also at k = 0
Ec = 1.8 + 0.65*k.^2;

figure('Color','w');

plot(k,Ev,'LineWidth',2); hold on;
plot(k,Ec,'LineWidth',2);

grid on;
box on;

xlabel('k');
ylabel('Energy, E');
title('GaAs — Direct Bandgap');

% Bandgap
plot([0 0],[0.6 1.8],'k--','LineWidth',1.3);
text(0.08,1.2,'E_g','FontSize',13,'FontWeight','bold');

plot(0,0.6,'ko','MarkerFaceColor','k');
plot(0,1.8,'ko','MarkerFaceColor','k');

text(0.12,0.62,'Valence-band maximum');
text(0.12,1.82,'Conduction-band minimum');

legend('Valence band','Conduction band','Location','best');

hold off;