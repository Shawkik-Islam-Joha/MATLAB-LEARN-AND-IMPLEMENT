clc;
clear;
close all;

%% Figure Setup
figure('Color', 'w');
axis([0 10 0 10]);     % Window size
axis equal;
grid on;
hold on;

xlabel('X');
ylabel('Y');
title('Animated Bouncing Ball');

%% Ball Properties
x = 5;          % Initial x-position
y = 5;          % Initial y-position

vx = 0.08;      % Velocity in x-direction
vy = 0.06;      % Velocity in y-direction

r = 0.3;        % Radius of the ball

%% Draw the Ball
ball = rectangle( ...
    'Position',[x-r, y-r, 2*r, 2*r], ...
    'Curvature',[1 1], ...
    'FaceColor','r', ...
    'EdgeColor','k');

%% Animation Loop
while ishandle(ball)

    % Update Position
    x = x + vx;
    y = y + vy;

    % Bounce from Left and Right Walls
    if x + r >= 10 || x - r <= 0
        vx = -vx;
    end

    % Bounce from Top and Bottom Walls
    if y + r >= 10 || y - r <= 0
        vy = -vy;
    end

    % Move Ball
    ball.Position = [x-r, y-r, 2*r, 2*r];

    drawnow;
    pause(0.01);

end