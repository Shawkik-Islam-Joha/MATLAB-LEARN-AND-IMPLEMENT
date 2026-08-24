clc;
clear;
close all;

N = 1300;                  
echo_delay = 500;          
echo_amplitude = 0.5;      
noise_amplitude = 1.0;     

burst_length = 300;        
f0 = 4/burst_length;       

tx = zeros(1,N);

t = 0:burst_length-1;
tx(1:burst_length) = 10*sin(2*pi*f0*t);

echo = zeros(1,N);
echo(echo_delay+1:echo_delay+burst_length) = echo_amplitude*sin(2*pi*f0*t);
noise = noise_amplitude*randn(1,N);
received = echo + noise;

[rxy,lags] = xcorr(received,tx,'coeff');

[peak_value,peak_index] = max(abs(rxy));

detected_delay = lags(peak_index);

fprintf('Detected echo delay = %d samples\n', detected_delay);
fprintf('Correlation peak = %.4f\n', peak_value);

figure;

subplot(4,1,1);
plot(tx);
grid on;
xlabel('Sample');
ylabel('Amplitude');
title('(a) Transmitted Tone Burst');

subplot(4,1,2);
plot(echo);
grid on;
xlabel('Sample');
ylabel('Amplitude');
title('(b) Weak Echo');

subplot(4,1,3);
plot(received);
grid on;
xlabel('Sample');
ylabel('Amplitude');
title('(c) Echo + Noise');

subplot(4,1,4);
plot(lags,rxy);
grid on;
xlabel('Lag');
ylabel('Normalized Correlation');
title('(d) Cross-Correlation for Echo Detection');

hold on;
plot(detected_delay, rxy(peak_index), 'ro');
legend('Cross-Correlation','Detected Echo');