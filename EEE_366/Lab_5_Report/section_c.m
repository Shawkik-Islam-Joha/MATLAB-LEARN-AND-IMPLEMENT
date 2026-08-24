clc;
clear;
close all;

Fs = 1000;
Ts = 1 / Fs;
N = 64;
f0 = 50;

n = 0:N-1;
t = n * Ts;

x = sin(2 * pi * f0 * t);

X = fft(x);

frequencies = (0:N-1) * (Fs / N);

magnitude = abs(X);
phase = angle(X);

figure;
subplot(3,1,1);
plot(t, x, '-o');
grid on;
title('Original Sinusoidal Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
stem(frequencies, magnitude, 'LineWidth', 1.5);
grid on;
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('|X[k]|');

subplot(3,1,3);
stem(frequencies, phase, 'LineWidth', 1.5);
grid on;
title('Phase Spectrum');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');

ZP = 256;
x_padded = [x, zeros(1, ZP - length(x))];
X_padded = fft(x_padded);

frequencies_zp = (0:ZP-1) * (Fs / ZP);

figure;
plot(frequencies_zp, abs(X_padded), 'LineWidth', 1.5);
grid on;
title('Magnitude Spectrum with Zero Padding');
xlabel('Frequency (Hz)');
ylabel('|X[k]|');

x_reconstructed = ifft(X);

figure;
plot(t, x, '-o', 'DisplayName', 'Original');
hold on;
plot(t, real(x_reconstructed), '--*', 'DisplayName', 'Reconstructed');
grid on;
title('Original vs. Reconstructed Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend;