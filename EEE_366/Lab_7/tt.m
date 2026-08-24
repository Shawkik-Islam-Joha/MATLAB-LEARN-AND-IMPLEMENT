clear; clc; close all;

Fs = 600;
Ts = 1/Fs;
N  = 64;
f0 = 60;

n = 0:N-1;
t = n*Ts;

x = sin(2*pi*f0*t);

X = fft(x, N);
freq = (0:N-1) * (Fs/N);

magX   = abs(X);
phaseX = angle(X);

figure;
subplot(3,1,1);
stem(n, x, 'filled', 'LineWidth', 1.5);
title('Discrete-Time Sinusoidal Signal');
xlabel('Sample index n'); ylabel('Amplitude'); grid on;

subplot(3,1,2);
stem(freq, magX, 'b', 'LineWidth', 1.5);
title('FFT Magnitude Spectrum');
xlabel('Frequency (Hz)'); ylabel('|X[k]|'); 
grid on;

subplot(3,1,3);
stem(freq, phaseX, 'b', 'LineWidth', 1.5);
title('FFT Phase Spectrum');
xlabel('Frequency (Hz)'); ylabel('Phase (rad)');
grid on;