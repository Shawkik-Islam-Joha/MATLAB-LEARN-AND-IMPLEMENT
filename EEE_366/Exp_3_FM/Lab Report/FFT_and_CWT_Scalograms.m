clc;
clear;
close all;

fs = 500;
t = 0:1/fs:4-1/fs;
N = length(t);

xA = zeros(size(t));
xA(t < 2) = sin(2*pi*10*t(t < 2));
xA(t >= 2) = sin(2*pi*40*t(t >= 2));

XA = abs(fft(xA))/N;
f = (0:N-1)*(fs/N);

figure('Name','Signal A','Color','w')

subplot(3,1,1)
plot(t,xA,'b','LineWidth',1.2)
grid on
title('Time Domain Signal A')
xlabel('Time (s)')
ylabel('Amplitude')
xlim([0 4])

subplot(3,1,2)
plot(f(1:N/2),XA(1:N/2),'r','LineWidth',1.2)
grid on
title('FFT Spectrum')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
xlim([0 60])

subplot(3,1,3)
[wtA,fA] = cwt(xA,fs);
surface(t,fA,abs(wtA))
shading flat
axis tight
colormap jet
colorbar
set(gca,'YScale','log')
ylim([1 60])
title('CWT Scalogram')
xlabel('Time (s)')
ylabel('Frequency (Hz)')

xB = zeros(size(t));
xB(t < 2) = sin(2*pi*40*t(t < 2));
xB(t >= 2) = sin(2*pi*10*t(t >= 2));

XB = abs(fft(xB))/N;

figure('Name','Signal B','Color','w')

subplot(3,1,1)
plot(t,xB,'b','LineWidth',1.2)
grid on
title('Time Domain Signal B')
xlabel('Time (s)')
ylabel('Amplitude')
xlim([0 4])

subplot(3,1,2)
plot(f(1:N/2),XB(1:N/2),'r','LineWidth',1.2)
grid on
title('FFT Spectrum')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
xlim([0 60])

subplot(3,1,3)
[wtB,fB] = cwt(xB,fs);
surface(t,fB,abs(wtB))
shading flat
axis tight
colormap jet
colorbar
set(gca,'YScale','log')
ylim([1 60])
title('CWT Scalogram')
xlabel('Time (s)')
ylabel('Frequency (Hz)')
