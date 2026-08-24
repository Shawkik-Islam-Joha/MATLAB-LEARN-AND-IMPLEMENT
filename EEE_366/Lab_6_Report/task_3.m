clc;
clear;
close all;

N = 1000;
x = randn(1, N);
[acf, lags] = xcorr(x, 'coeff');

figure;
subplot(2,1,1);
plot(x);
grid on;
xlabel('Sample Index');
ylabel('Amplitude');
title('Random White Noise Sequence');
subplot(2,1,2);
stem(lags, acf, 'filled');
grid on;
xlabel('Lag');
ylabel('ACF');
title('Autocorrelation of White Noise');