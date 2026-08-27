E = linspace(-5,5,1000);   % E - EF, normalized to kT
x = E;

fFD = 1 ./ (1 + exp(x));

fMB = exp(-x);

figure
plot(x,fFD,'LineWidth',2)
hold on
plot(x,fMB,'--','LineWidth',2)

xlabel('(E-E_F)/kT')
ylabel('Probability')
title('Fermi-Dirac Function and Maxwell-Boltzmann Approximation')
legend('Fermi-Dirac','Maxwell-Boltzmann')
ylim([0 1.1])
grid on