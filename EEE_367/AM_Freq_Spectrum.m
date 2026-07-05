clc;
clear;
close all;

% Parameters
fc = 300;      % Carrier frequency (kHz)
fm = 2;        % Message bandwidth (kHz)

% Frequency components
f = [fc-fm fc fc+fm];

% Relative amplitudes
A = [0.5 1 0.5];

% Plot
figure;
stem(f, A, 'filled', 'LineWidth', 2);
grid on;

xlabel('Frequency (kHz)');
ylabel('Amplitude');
title('AM Spectrum');

xlim([295 305]);
ylim([0 1.2]);

% Labels
text(fc-fm, 0.55, 'LSB (298 kHz)', ...
    'HorizontalAlignment','center');

text(fc, 1.05, 'Carrier (300 kHz)', ...
    'HorizontalAlignment','center');

text(fc+fm, 0.55, 'USB (302 kHz)', ...
    'HorizontalAlignment','center');