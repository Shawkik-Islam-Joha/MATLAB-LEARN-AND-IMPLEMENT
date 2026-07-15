% Question 1: Write a MATLAB program to generate and plot a discrete-time
% sinusoidal signal with amplitude = 1, normalized frequency = 0.1
% cycles/sample, phase = 0, for n = 0 to 20.

clc;
clear;
close all;
n = 0:20;
A = 1;
f = 0.1;
phi = 0;
x = A*sin(2*pi*f*n + phi);
stem(n, x, 'filled');
grid on;
xlabel('n');
ylabel('x[n]');
title('Discrete Sinusoidal Signal');