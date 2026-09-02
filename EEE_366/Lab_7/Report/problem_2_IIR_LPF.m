% Source code written by - SHAWKIK ISLAM JOHA, ID: 2202124
x = 124;
A = x/2;
An = x/4;
f = 5;
fs = 1000;
t = 1;
fn = 50;
sample = 0:(1/fs):1;
y = A*sin(2*pi*f*sample);
n = An*sin(2*pi*fn*sample);
z = y + n;

figure;
subplot(2,2,1);
plot(sample,y);
title('Original Signal Time Domain');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

subplot(2,2,2);
plot(abs(fft(y,1024)));
title('Original Signal Frequency Domain');
xlabel('Frequency(Hz)');
ylabel('Magnitude');
xlim([0 100]);
grid on;

subplot(2,2,3);
plot(sample,z);
title('Noisy Signal Time Domain');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

subplot(2,2,4);
plot(abs(fft(z,1024)));
title('Noisy Signal Frequency Domain');
xlabel('Frequency(Hz)');
ylabel('Magnitude');
xlim([0 100]);
grid on;

figure;

fc = 10;
wc = fc/(fs/2);

filter_order = 1;
[b,a] = butter(filter_order,wc,'low');

subplot(3,2,1);
filtered_z = filter(b,a,z);
plot(sample,filtered_z);
title('Filtered Signal Time Domain - Order 1');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

subplot(3,2,2);
plot(abs(fft(filtered_z,1024)));
title('Filtered Signal Frequency Domain - Order 1');
xlabel('Frequency(Hz)');
ylabel('Magnitude');
xlim([0 100]);
grid on;

filter_order = 2;
[b,a] = butter(filter_order,wc,'low');

subplot(3,2,3);
filtered_z = filter(b,a,z);
plot(sample,filtered_z);
title('Filtered Signal Time Domain - Order 2');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

subplot(3,2,4);
plot(abs(fft(filtered_z,1024)));
title('Filtered Signal Frequency Domain - Order 2');
xlabel('Frequency(Hz)');
ylabel('Magnitude');
xlim([0 100]);
grid on;

filter_order = 4;
[b,a] = butter(filter_order,wc,'low');

subplot(3,2,5);
filtered_z = filter(b,a,z);
plot(sample,filtered_z);
title('Filtered Signal Time Domain - Order 4');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

subplot(3,2,6);
plot(abs(fft(filtered_z,1024)));
title('Filtered Signal Frequency Domain - Order 4');
xlabel('Frequency(Hz)');
ylabel('Magnitude');
xlim([0 100]);
grid on;