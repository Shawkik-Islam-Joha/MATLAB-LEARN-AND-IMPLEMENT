clc;
clear;
close all;

Fs = 100e3;
T = 1e-3;
D = 0.1;
PW = D * T;

t = -T/2 : 1/Fs : T/2;
x = (mod(t, T) < PW);

N = length(x);

X = fft(x);

freq = linspace(-Fs/2, Fs/2, N);
X_shifted = fftshift(X);

figure;

subplot(2,1,1);
plot(freq, abs(X_shifted), 'LineWidth', 1.5);
grid on;
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');

subplot(2,1,2);
plot(freq, angle(X_shifted), 'LineWidth', 1.5);
grid on;
title('Phase Spectrum');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');