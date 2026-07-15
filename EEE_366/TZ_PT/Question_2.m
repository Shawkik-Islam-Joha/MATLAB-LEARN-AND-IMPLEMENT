% Question 2: Write a MATLAB program to perform the linear convolution of
% x[n] = sin(2*pi*n), n = -5:5 and h[n] = [2 1 3 2], and plot the results.

clc;
clear;
close all;
n = -5:5;
x = sin(2*pi*n);
h = [2 1 3 2];
y = conv(x, h);
subplot(3,1,1);
stem(n, x, 'filled');
title('x[n] = sin(2\pi n)');
grid on;
subplot(3,1,2);
stem(0:length(h)-1, h, 'filled');
title('Random Signal h[n]');
grid on;
subplot(3,1,3);
stem(y, 'filled');
title('Convolution y[n] = x[n] * h[n]');
grid on;