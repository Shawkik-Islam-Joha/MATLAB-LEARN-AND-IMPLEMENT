clc;
clear;
close all;

w0 = 2*pi;
fs = 1000;
t = 0:1/fs:1;
x = sin(w0*t);
[acf, lags] = xcorr(x, 'coeff');
tau = lags/fs;
figure;

subplot(2,1,1);
plot(t, x);
grid on;
xlabel('Time (s)');
ylabel('x(t)');
title('Sine Wave');

subplot(2,1,2);
plot(tau, acf);
grid on;
xlabel('Lag (\tau) (s)');
ylabel('ACF');
title('Autocorrelation Function of Sine Wave');