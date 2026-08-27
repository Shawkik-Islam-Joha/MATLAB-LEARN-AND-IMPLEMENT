%% Slope of an E-k curve
k = linspace(-2,2,500);
E = 0.5*k.^2;

figure('Color','w');
plot(k,E,'LineWidth',2);
grid on; box on;
xlabel('k');
ylabel('E');
title('E-k Curve: Slope Determines Velocity');

hold on;
k0 = 1.0;
E0 = 0.5*k0^2;

% Tangent line at k0
slope = k0;
kt = linspace(0.4,1.6,100);
Et = E0 + slope*(kt-k0);

plot(kt,Et,'--','LineWidth',1.5);
plot(k0,E0,'ko','MarkerFaceColor','k');

text(1.05,E0+0.3,'slope = dE/dk');
hold off;