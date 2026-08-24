clear;
clc;
close all;

figure('Color','k');

x = linspace(0, 20, 1000);

for t = 1:500

    % Multiple waves combined
    y = sin(x + t*0.1) ...
        + 0.5*sin(2*x + t*0.15) ...
        + 0.25*sin(4*x - t*0.2);

    plot(x, y, 'c', 'LineWidth', 2);

    axis([0 20 -2 2]);
    grid on;

    drawnow;
    cla;
end