clear;
clc;
close all;

figure('Color','k');

[X,Y] = meshgrid(linspace(-5,5,100), ...
                 linspace(0,10,150));

for t = 1:500

    % Moving fire-like waves
    Z = exp(-(X.^2)/3) .* ...
        abs(sin(2*Y - t*0.15)) .* ...
        exp(-Y/5);

    surf(X,Y,Z, ...
        'EdgeColor','none');

    view(2);
    axis equal;
    axis([-5 5 0 10]);
    axis off;

    colormap(hot);

    drawnow;
    cla;
end