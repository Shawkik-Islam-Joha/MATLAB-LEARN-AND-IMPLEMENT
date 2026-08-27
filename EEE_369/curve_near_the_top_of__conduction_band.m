k = linspace(-2,2,500);

Ev = 1.0;
mp = 0.5;

E = Ev - k.^2/(2*mp);

figure('Color','w');
plot(k,E,'LineWidth',2);
grid on; box on;

xlabel('k');
ylabel('Energy');
title('Valence Band Near Its Maximum');

hold on;
yline(Ev,'--','E_v');
xline(0,'--','k = 0');
hold off;