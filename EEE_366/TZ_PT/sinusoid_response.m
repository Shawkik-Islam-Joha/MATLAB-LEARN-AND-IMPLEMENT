clc;
clear;
close all;

n = -10:0.5:10;
A = 0.5;
x = A*sin(2*pi*n);

stem(n, x);
grid on;
xlabel('n');
ylabel('x[n]');
title('Discrete Sinusoidal Signal');