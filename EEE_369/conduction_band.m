clear; clc; close all;

% Normalized energy
Ec = 0;
EF = -0.25;       % eV below Ec
kT = 0.0259;      % eV, approximately at 300 K

E = linspace(Ec, Ec + 0.25, 1000);

% Conduction-band density of states (normalized)
gc = sqrt(E - Ec);

% Exact Fermi-Dirac probability
fFD = 1 ./ (1 + exp((E - EF)/kT));

% Boltzmann approximation
fB = exp(-(E - EF)/kT);

% Electron distribution
nE = gc .* fB;

figure;

plot(E, gc, 'LineWidth', 2);
hold on;
plot(E, fB, '--', 'LineWidth', 2);
plot(E, nE, 'LineWidth', 2);

xlabel('Energy E (eV)');
ylabel('Normalized quantity');
title('Conduction Band: DOS, Boltzmann Probability, and n(E)');
legend('g_c(E)', 'f_F(E) \approx Boltzmann', 'g_c(E)f_F(E)');
grid on;
xline(Ec, '--', 'E_c');
xline(EF, '--', 'E_F');

hold off;