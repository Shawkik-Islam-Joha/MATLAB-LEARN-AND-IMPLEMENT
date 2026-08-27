k = linspace(-2,2,500);

Ec = 1.0;
mn_star = 0.5;

E = Ec + k.^2/(2*mn_star);

figure('Color','w');
plot(k,E,'LineWidth',2);
grid on; box on;

xlabel('k');
ylabel('Energy');
title('Conduction Band Near Its Minimum');

hold on;
yline(Ec,'--','E_c');
xline(0,'--','k = 0');
hold off;