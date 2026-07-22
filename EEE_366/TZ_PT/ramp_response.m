clc;
clear;
close all;

n = -10:0.5:10;

x = n .* (n >= 0);

stem(n, x);
grid on;
xlabel('n');
ylabel('r[n]');
title('Unit Ramp Signal');