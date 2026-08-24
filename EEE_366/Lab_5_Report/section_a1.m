clc;
clear;
close all;

Fs = 100e3;
T = 1e-3;
D = 0.1;
PW = D * T;

t = -T/2 : 1/Fs : T/2;
x = (mod(t, T) < PW);

figure;
plot(t, x, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Periodic Rectangular Pulse Train');