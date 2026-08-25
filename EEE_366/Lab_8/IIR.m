% Define signal parameters
fs = 1000;          % Sampling frequency (Hz)
f = 5;              % Original signal frequency (Hz)
A = 10;             % Original signal amplitude
t = 5;              % Signal duration (seconds)

% Define noise parameters
fn = 50;            % Noise frequency (Hz)
An = 5;             % Noise amplitude

% Create the time vector
n = 0:(1/fs):t;

% Generate the original sine wave
x = A * sin(2*pi*f*n);

% Generate the sinusoidal noise
y = An * sin(2*pi*fn*n);

% Add noise to the original signal
z = x + y;


% Design a 4th-order Butterworth low-pass filter
orderoffilter = 4;                 % Filter order
fc = 10;                           % Cutoff frequency (Hz)
wc = fc/(fs/2);                    % Normalized cutoff frequency

% Calculate Butterworth filter coefficients
[b,a] = butter(orderoffilter,wc,'low');

% Apply the filter to the noisy signal
z_filtered = filter(b,a,z);


% Create a figure for all plots
figure;

% Original signal in time domain
subplot(3,2,1);
plot(n,x);
title('Original Signal Time');

% Original signal in frequency domain
subplot(3,2,2);
plot(abs(fft(x,1024)));
title('Original Signal FFT');
xlim([0,100]);

% Noisy signal in time domain
subplot(3,2,3);
plot(n,z);
title('Noisy Signal Time');

% Noisy signal in frequency domain
subplot(3,2,4);
plot(abs(fft(z,1024)));
title('Noisy Signal FFT');
xlim([0,100]);

% Filtered signal in time domain
subplot(3,2,5);
plot(n,z_filtered);
title('Filtered Signal Time');

% Filtered signal in frequency domain
subplot(3,2,6);
plot(abs(fft(z_filtered,1024)));
title('Filtered Signal FFT');
xlim([0,100]);