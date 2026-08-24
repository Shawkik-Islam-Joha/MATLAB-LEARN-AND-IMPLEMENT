%% 🌌 SPINNING GALAXY ANIMATION
clear;
clc;
close all;

figure('Color','k');

axis equal;
axis([-10 10 -10 10]);
axis off;
hold on;

% Number of stars
N = 1000;

% Random radius
r = 10 * sqrt(rand(1,N));

% Random starting angles
theta = 2*pi*rand(1,N);

% Spiral amount
spiral = 0.5 * r;

% Star positions
x = r .* cos(theta + spiral);
y = r .* sin(theta + spiral);

% Draw stars
stars = scatter(x, y, 10, rand(1,N), 'filled');

% Animation
for t = 1:1000

    % Rotate galaxy
    theta = theta + 0.03;

    % Create spiral motion
    x = r .* cos(theta + spiral);
    y = r .* sin(theta + spiral);

    % Update stars
    set(stars, 'XData', x, 'YData', y);

    drawnow;
end