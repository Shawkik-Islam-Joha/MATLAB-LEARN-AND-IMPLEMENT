clc;
clear;
close all;

%% Parameters
L1 = 1;          % Length of first rod (m)
L2 = 1;          % Length of second rod (m)

m1 = 1;          % Mass 1 (kg)
m2 = 1;          % Mass 2 (kg)

g = 9.81;        % Gravity (m/s^2)

%% Initial Conditions
theta1 = pi/2;       % Initial angle of pendulum 1
theta2 = pi/2 + 0.5; % Initial angle of pendulum 2

omega1 = 0;          % Angular velocity 1
omega2 = 0;          % Angular velocity 2

dt = 0.01;

%% Figure
figure('Color','w');
axis equal
axis([-2.2 2.2 -2.2 2.2]);
grid on
hold on

rod1 = plot([0 0],[0 0],'k','LineWidth',3);
rod2 = plot([0 0],[0 0],'k','LineWidth',3);

bob1 = plot(0,0,'ro','MarkerSize',15,...
    'MarkerFaceColor','r');

bob2 = plot(0,0,'bo','MarkerSize',15,...
    'MarkerFaceColor','b');

trail = animatedline('Color',[0 0.5 1],...
    'LineWidth',1.5);

%% Animation Loop
while ishandle(gcf)

    delta = theta2 - theta1;

    % Angular acceleration of first pendulum
    alpha1 = ( ...
        m2*g*sin(theta2)*cos(delta) ...
        - m2*sin(delta)*(L1*omega1^2*cos(delta) + L2*omega2^2) ...
        - (m1+m2)*g*sin(theta1) ) ...
        /(L1*(m1+m2*sin(delta)^2));

    % Angular acceleration of second pendulum
    alpha2 = ( ...
        (m1+m2)*( ...
        L1*omega1^2*sin(delta) ...
        - g*sin(theta2) ...
        + g*sin(theta1)*cos(delta)) ...
        + m2*L2*omega2^2*sin(delta)*cos(delta) ) ...
        /(L2*(m1+m2*sin(delta)^2));

    % Euler Integration
    omega1 = omega1 + alpha1*dt;
    omega2 = omega2 + alpha2*dt;

    theta1 = theta1 + omega1*dt;
    theta2 = theta2 + omega2*dt;

    %% Cartesian Coordinates
    x1 = L1*sin(theta1);
    y1 = -L1*cos(theta1);

    x2 = x1 + L2*sin(theta2);
    y2 = y1 - L2*cos(theta2);

    %% Update Graphics
    set(rod1,'XData',[0 x1],'YData',[0 y1]);
    set(rod2,'XData',[x1 x2],'YData',[y1 y2]);

    set(bob1,'XData',x1,'YData',y1);
    set(bob2,'XData',x2,'YData',y2);

    addpoints(trail,x2,y2);

    drawnow
end