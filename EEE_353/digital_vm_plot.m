clc;
clear;
close all;

% -----------------------------
% Data (Standard vs ESP)
% -----------------------------
ESP = [0.9 1.9 2.24 2.83 3.78 4.6 5.2 5.75 6.16 8.87 ...
       10.31 11.78 12.72 14.31 15.91 16.49 17.35 18.7 19.97];

Volt = [1.13 1.97 2.25 2.84 3.72 4.61 5.21 5.75 6.16 8.77 ...
        10.25 11.73 12.64 14.27 15.13 16.42 17.5 18.9 19.97];

% -----------------------------
% Error (distance from ideal)
% -----------------------------
abs_error = abs(ESP - Volt);
threshold = 0.1;

good_idx = abs_error <= threshold;
bad_idx  = abs_error > threshold;

% -----------------------------
% Colors (RGB from HEX)
% -----------------------------
green = [0/255, 191/255, 165/255];     % #00BFA5
coral = [255/255, 82/255, 82/255];     % #FF5252
gray  = [69/255, 90/255, 100/255];     % #455A64
bg    = [245/255, 247/255, 250/255];   % #F5F7FA

% -----------------------------
% Plot
% -----------------------------
figure;
set(gcf, 'Color', bg);   % background color
hold on;

% Accurate points (green)
scatter(Volt(good_idx), ESP(good_idx), 35, green, 'filled');

% Deviated points (coral)
scatter(Volt(bad_idx), ESP(bad_idx), 35, coral, 'filled');

% Ideal line
plot([0 20], [0 20], '--', 'Color', gray, 'LineWidth', 2);

% Labels & title
xlabel('Standard Voltage (V)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('ESP32 Measured Voltage (V)', 'FontSize', 12, 'FontWeight', 'bold');
title('Performance of Digital Voltmeter', 'FontSize', 14, 'FontWeight', 'bold');

% Legend
legend('Accurate Points', 'Deviated Points', 'Ideal (y = x)', ...
       'Location', 'northwest');

% Grid styling
ax = gca;
ax.Color = bg;
ax.GridColor = [0.8 0.8 0.8];
ax.GridAlpha = 0.5;

grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1.2);

xlim([0 21]);
ylim([0 21]);

hold off;