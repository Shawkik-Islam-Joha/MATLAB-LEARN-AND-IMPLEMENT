clear;
clc;
close all;

figure('Color','k');

N = 1500;

% Random particles
r = 3 + 7*rand(1,N);
theta = 2*pi*rand(1,N);

for t = 1:1000

    % Particles orbit and slowly spiral inward
    theta = theta + 0.03*(8./r).^1.5;

    r = r - 0.002;

    % Reset particles that fall in
    idx = r < 1.5;

    r(idx) = 10;
    theta(idx) = 2*pi*rand(1,sum(idx));

    % Coordinates
    x = r .* cos(theta);
    y = r .* sin(theta);

    scatter(x,y,5,'filled');

    hold on;

    % Black hole
    scatter(0,0,300,'k','filled');

    axis equal;
    axis([-11 11 -11 11]);
    axis off;

    drawnow;
    cla;
end