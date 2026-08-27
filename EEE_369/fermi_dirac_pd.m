E = linspace(0, 2, 1000);
EF = 1;

f = double(E < EF);

plot(E,f,'LineWidth',2)
xlabel('E')
ylabel('f_F(E)')
title('Fermi-Dirac probability at T = 0 K')
grid on