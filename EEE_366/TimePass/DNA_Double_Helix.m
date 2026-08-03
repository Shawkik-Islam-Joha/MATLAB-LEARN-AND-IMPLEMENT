clc;
clear;
close all;

%% Parameters
turns = 8;                  % Number of turns
points = 1000;              % Number of points
radius = 1;                 % Helix radius
height = 10;                % Height of DNA

t = linspace(0, 2*pi*turns, points);

% Helix coordinates
x1 = radius*cos(t);
y1 = radius*sin(t);
z = linspace(0, height, points);

x2 = radius*cos(t + pi);
y2 = radius*sin(t + pi);

%% Figure
figure('Color','k');
hold on;
grid on;
axis equal;
axis([-2 2 -2 2 0 height]);

xlabel('X','Color','w');
ylabel('Y','Color','w');
zlabel('Z','Color','w');

set(gca,...
    'Color','k',...
    'XColor','w',...
    'YColor','w',...
    'ZColor','w',...
    'FontSize',12);

title('Animated DNA Double Helix','Color','w','FontSize',16);

%% Draw the two strands
helix1 = plot3(x1,y1,z,...
    'c','LineWidth',3);

helix2 = plot3(x2,y2,z,...
    'm','LineWidth',3);

%% Draw base pairs
for k = 1:20:points
    plot3([x1(k) x2(k)],...
          [y1(k) y2(k)],...
          [z(k) z(k)],...
          'w','LineWidth',1.5);
end

%% Animation
while ishandle(gcf)

    for angle = 1:360

        view(angle,25);

        drawnow;
        pause(0.02);

        if ~ishandle(gcf)
            break
        end

    end

end