%% Silicon - conceptual indirect bandgap E-k diagram

clear; close all; clc;

k = linspace(-2,2,500);

% Valence band maximum at k = 0
Ev = 0.6 - 0.35*k.^2;

% Conduction minimum displaced from k = 0
Ec = 1.8 + 0.65*(k-0.9).^2;

figure('Color','w');

plot(k,Ev,'LineWidth',2); hold on;
plot(k,Ec,'LineWidth',2);

grid on;
box on;

xlabel('k along [100]');
ylabel('Energy, E');
title('Silicon — Indirect Bandgap');

% Mark extrema
plot(0,0.6,'ko','MarkerFaceColor','k');
plot(0.9,1.8,'ko','MarkerFaceColor','k');

text(0.08,0.62,'Valence-band maximum');
text(0.98,1.82,'Conduction-band minimum');

% Show horizontal displacement
plot([0 0.9],[1.0 1.0],'k--');
text(0.35,1.05,'different k values');

legend('Valence band','Conduction band','Location','best');

hold off;