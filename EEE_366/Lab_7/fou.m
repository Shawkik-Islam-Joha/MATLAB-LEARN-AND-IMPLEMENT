clc;
clear;
close all;

n = 0:0.5:100;
x = sin(pi/4 * n);

N = length(x);

X = fft(x);

w = 2*pi*(0:N-1)/N;

figure;

subplot(3,1,1);
stem(n, x, 'filled');
grid on;
xlabel('n');
ylabel('x[n]');
title('Discrete-Time Sinusoidal Signal');

subplot(3,1,2);
stem(w, abs(X), 'filled');
grid on;
xlabel('\omega (rad/sample)');
ylabel('|X[k]|');
title('Magnitude Spectrum using FFT');

subplot(3,1,3);
stem(angle(X));
grid on;
xlabel('\omega (rad/sample)');
ylabel('|X[k]|');
title('Angle Spectrum using FFT');