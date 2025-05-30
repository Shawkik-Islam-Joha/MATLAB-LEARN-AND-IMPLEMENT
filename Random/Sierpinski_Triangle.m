% Sierpinski Triangle using Chaos Game Method

clc;
clear;

% Define the three vertices of an equilateral triangle
A = [0, 0];
B = [1, 0];
C = [0.5, sqrt(3)/2];

% Plot settings
num_points = 50000;      % Number of points to plot
X = zeros(num_points, 1);
Y = zeros(num_points, 1);

% Starting point (can be random inside the triangle)
P = [0.1, 0.1];

for i = 1:num_points
    % Randomly choose one of the three vertices
    r = randi(3);
    if r == 1
        vertex = A;
    elseif r == 2
        vertex = B;
    else
        vertex = C;
    end
    
    % Move halfway towards the chosen vertex
    P = (P + vertex) / 2;
    
    % Store the point
    X(i) = P(1);
    Y(i) = P(2);
end

% Plot the points
figure;
plot(X, Y, '.', 'MarkerSize', 1);
axis equal off;
title('Sierpinski Triangle (Chaos Game Method)');
