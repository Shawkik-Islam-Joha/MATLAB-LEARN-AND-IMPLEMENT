%% MATLAB Lab: Time-Domain vs. Fourier (FFT) vs. Wavelet (CWT)
% Objective: Compare FFT and CWT on a non-stationary signal.

clear; clc; close all;
load earthquake.mat;
%% Step 1: Create a Non-Stationary Signal
fs = 1000;                  % Sampling frequency (1000 Hz)
dt = 1/fs;                  % Time step
t = 0:dt:2-dt;              % 2 seconds duration (2000 samples)

% Component 1 (0 to 1 sec): 100 Hz High-Frequency Sine Wave
x1 = sin(2*pi*100*t(t < 1));

% Component 2 (1 to 2 sec): 10 Hz Low-Frequency Sine Wave
x2 = sin(2*pi*10*t(t >= 1));

% Combine both sections
x = [x1, x2];

% Add a sharp transient spike (glitch) at t = 0.5 seconds
spike_index = round(0.5 * fs);
x(spike_index) = x(spike_index) + 3.5;

%% Step 2: Initialize Master Figure Window
figure('Name', 'Signal Analysis: Time vs FFT vs Wavelet', 'Color', 'w');

% --- SUBPLOT 1: Time-Domain Signal ---
subplot(3, 1, 1);
plot(t, x, 'b', 'LineWidth', 1.2);
grid on;
title('1. Time Domain Signal (100 Hz -> 10 Hz Jump at t=1s, Spike at t=0.5s)');
xlabel('Time (seconds)');
ylabel('Amplitude');
xlim([0, 2]);

% --- SUBPLOT 2: Fast Fourier Transform (FFT) ---
N = length(x);
X_fft = abs(fft(x)) / N;             % Magnitude spectrum
f_axis = (0:N-1) * (fs / N);         % Frequency axis

subplot(3, 1, 2);
plot(f_axis(1:N/2), X_fft(1:N/2), 'r', 'LineWidth', 1.5); %(N/2) is used to
% to remove mirror frequencies as a result of FFT
grid on;
title('2. Fast Fourier Transform (FFT) Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0, 150]);

% --- SUBPLOT 3: Continuous Wavelet Transform (CWT) ---
subplot(3, 1, 3);

% CWT calculation
[wt, f] = cwt(x, fs); %morse wavelet by default
% wt are the 2D matrix of complex wavelet coefficients and f are the center
% frequencies

% Plot magnitude heat map
surface(t, f, abs(wt));
shading flat;
axis tight;
colormap jet;
c = colorbar;
c.Label.String = 'Magnitude';

set(gca, 'YScale', 'log');          % Set logarithmic frequency axis
%gca = get current axis
title('3. Continuous Wavelet Transform (CWT Scalogram)');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
ylim([1, 150]);