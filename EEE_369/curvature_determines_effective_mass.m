k = linspace(-2,2,500);

E = 2*k.^2;

figure('Color','w');
plot(k,E,'LineWidth',2);
grid on; box on;
xlabel('k');
ylabel('E');
title('Large Curvature → Smaller Effective Mass');