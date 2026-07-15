% Question 3: Write a MATLAB program to compute the cross-correlation
% between x[n] = sin(2*pi*n), n = -5:5 and h[n] = [2 1 3 2] using xcorr(), and plot
% the results.

clc;
clear;
close all;
n = -5:5;
x = sin(2*pi*n);
h = [2 1 3 2];
y = xcorr(x, h);
subplot(3,1,1);
stem(n, x, 'filled');
title('x[n] = sin(2\pi n)');
grid on;
subplot(3,1,2);
stem(0:length(h)-1, h, 'filled');
title('Signal h[n]');
grid on;
subplot(3,1,3);
stem(y, 'filled');
title('Correlation r_{xh}[n]');
grid on;