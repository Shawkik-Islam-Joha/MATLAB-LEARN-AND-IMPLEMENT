% Question 4: Write a MATLAB program to compute the FFT of x[n] =
% sin(0.2*pi*n), n = 0:31, and plot its magnitude and phase spectra.

clc;
clear;
close all;
n = 0:31;
x = sin(0.2*pi*n);
X = fft(x);
mag = abs(X);
phase = angle(X);
subplot(2,1,1);
stem(mag,'filled');
title('Magnitude Spectrum');
grid on;
subplot(2,1,2);
stem(phase,'filled');
title('Phase Spectrum');
grid on;