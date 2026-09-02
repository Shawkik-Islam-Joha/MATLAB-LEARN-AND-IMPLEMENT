clc;
clear;
close all;

% Student ID = 001
x = 100 * 1;

% Generate the original signal
y = [zeros(1,x), ones(1,x), zeros(1,x)];

% Add random noise
rng(1);                         % For reproducible noise
noise = 0.4 * randn(size(y));
y_noisy = y + noise;

% Moving average filters of different sizes
window1 = 3;
window2 = 7;
window3 = 15;

y_ma3  = movmean(y_noisy, window1);
y_ma7  = movmean(y_noisy, window2);
y_ma15 = movmean(y_noisy, window3);

% Sample index
n = 1:length(y);

% Plot results
figure;

subplot(4,1,1);
plot(n, y, 'LineWidth', 1.5);
grid on;
title('Original Signal');
xlabel('Sample');
ylabel('Amplitude');
ylim([-0.2 1.2]);

subplot(4,1,2);
plot(n, y_noisy);
grid on;
title('Signal with Random Noise');
xlabel('Sample');
ylabel('Amplitude');

subplot(4,1,3);
plot(n, y_ma3, 'LineWidth', 1.2);
grid on;
title('Moving Average Filter - Window Size 3');
xlabel('Sample');
ylabel('Amplitude');

subplot(4,1,4);
plot(n, y_ma15, 'LineWidth', 1.2);
grid on;
title('Moving Average Filter - Window Size 15');
xlabel('Sample');
ylabel('Amplitude');

% Compare all moving average filters
figure;
plot(n, y_noisy);
hold on;
plot(n, y_ma3, 'LineWidth', 1.2);
plot(n, y_ma7, 'LineWidth', 1.2);
plot(n, y_ma15, 'LineWidth', 1.2);
grid on;

title('Comparison of Moving Average Filters');
xlabel('Sample');
ylabel('Amplitude');
legend('Noisy Signal', 'MA-3', 'MA-7', 'MA-15');