clc;
clear;
close all;

load chirp

x = y;
fs = Fs;
N = length(x);
t = (0:N-1)/fs;

figure('Name','Chirp Audio Signal','Color','w')

subplot(3,1,1)
plot(t,x,'b','LineWidth',1)
grid on
title('1. Time Domain Waveform')
xlabel('Time (s)')
ylabel('Amplitude')
xlim([0 max(t)])

X_fft = abs(fft(x))/N;
f = (0:N-1)*(fs/N);

subplot(3,1,2)
plot(f(1:floor(N/2)),X_fft(1:floor(N/2)),'r','LineWidth',1.2)
grid on
title('2. FFT Spectrum')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
xlim([0 fs/2])

subplot(3,1,3)
[wt,f] = cwt(x,fs);

surface(t,f,abs(wt))
shading flat
axis tight
colormap jet
colorbar
set(gca,'YScale','log')
title('3. Continuous Wavelet Transform (CWT) Scalogram')
xlabel('Time (s)')
ylabel('Frequency (Hz)')