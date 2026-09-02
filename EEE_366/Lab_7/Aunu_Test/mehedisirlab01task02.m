% Signal and Noise
fs = 1000;
f = 5;
A = 65;
fn = 50;
An = 32.5;
t = 1;
n = 0:1/fs:t;
x = A*sin(2*pi*f*n);
y = An*sin(2*pi*fn*n);
z = x + y;
% Original Signal
figure;
plot(n,x);
title('Original Signal');
% FFT of Original Signal
figure;
plot(abs(fft(x,1028)));
title('FFT of Original Signal');
xlim([0 100]);
% Noisy Signal
figure;
plot(n,z);
title('Noisy Signal');
% FFT of Noisy Signal
figure;
plot(abs(fft(z,1028)));
title('FFT of Noisy Signal');
xlim([0 100]);
% FIR Low Pass Filter
o_fir = 40;
fc = 10;
wc = 2*pi*fc/fs;
b_fir = fir1(o_fir,wc,'low');
x_f_fir = filter(b_fir,1,z);
figure;
plot(n,x_f_fir);
title('FIR Low Pass Filtered Signal');
figure;
plot(abs(fft(x_f_fir,1028)));
title('FFT of FIR Low Pass Filtered Signal');
xlim([0 100]);
% IIR Low Pass Filter
o_iir = 10;
fc = 10;
wc = 2*pi*fc/fs;
[b,a] = butter(o_iir,wc,'low');
x_f_iir = filter(b,a,z);
figure;
plot(n,x_f_iir);
title('IIR Low Pass Filtered Signal');
figure;
plot(abs(fft(x_f_iir,1028)));
title('FFT of IIR Low Pass Filtered Signal');
xlim([0 100]);
% FIR Band Stop Filter
o_fir = 40;
f1 = 45;
f2 = 55;
wc1 = 2*pi*f1/fs;
wc2 = 2*pi*f2/fs;
b_fir = fir1(o_fir,[wc1 wc2],'stop')
x_f_fir_bs = filter(b_fir,1,z);
figure;
plot(n,x_f_fir_bs);
title('FIR Band Stop Filtered Signal');
figure;
plot(abs(fft(x_f_fir_bs,1028)));
title('FFT of FIR Band Stop Filtered Signal');
xlim([0 100]);
% IIR Band Stop Filter
o_iir = 10;
f1 = 45;
f2 = 55;
wc1 = 2*pi*f1/fs;
wc2 = 2*pi*f2/fs;
[b,a] = butter(o_iir,[wc1 wc2],'stop');
x_f_iir_bs = filter(b,a,z);
figure;
plot(n,x_f_iir_bs);
title('IIR Band Stop Filtered Signal');
figure;
plot(abs(fft(x_f_iir_bs,1028)));
title('FFT of IIR Band Stop Filtered Signal');
xlim([0 100]);