clc;
clear;
close all;

n = -10:0.5:10;
x = 0.5 * sin(2*pi*n);

plot(n, x, '-o');
grid on;
xlabel('n');
ylabel('x[n]');
title('x[n] = 0.5sin(2\pi n)');