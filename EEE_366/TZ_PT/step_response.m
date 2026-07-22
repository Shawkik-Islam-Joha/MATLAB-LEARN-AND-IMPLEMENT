clc;
clear;
close all;

n = -10:0.5:10;
x = (n >= 0);

stem(n, x);
grid on;
xlabel('n');
ylabel('u[n]');
title('Unit Step Signal');