clc;
clear;
close all;

T = 4e-3;                 
tstep = T/100;            
t = tstep:tstep:T;
x = 2*cos(2*pi*t/T);
[acf, lags] = xcorr(x, 'coeff');

figure;

subplot(2,1,1);
stem(t*1000, x, 'filled');
grid on;
xlabel('Time (ms)');
ylabel('x(t)');
title('Cosine Signal - One Period');

subplot(2,1,2);
stem(lags*tstep*1000, acf, 'filled');
grid on;
xlabel('Lag (ms)');
ylabel('ACF');
title('Autocorrelation Function - One Period');

t = tstep:tstep:4*T;

x = 2*cos(2*pi*t/T);

[acf, lags] = xcorr(x, 'coeff');

figure;

subplot(2,1,1);
stem(t*1000, x, 'filled');
grid on;
xlabel('Time (ms)');
ylabel('x(t)');
title('Cosine Signal - Four Periods');

subplot(2,1,2);
stem(lags*tstep*1000, acf, 'filled');
grid on;
xlabel('Lag (ms)');
ylabel('ACF');
title('Autocorrelation Function - Four Periods');