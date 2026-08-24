n = 0:50;
x = sin(pi/4*n);

stem(n, x, 'filled', 'LineWidth', 1.2);
xlabel('n');
ylabel('x[n]');
title('Discrete Sinusoidal Signal');
grid on;
xlim([0 50]);
ylim([-5 5]);

