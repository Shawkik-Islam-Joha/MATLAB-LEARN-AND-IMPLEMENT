% Define the sampling frequency, signal frequency, amplitude, and duration
fs = 1000;          % Sampling frequency (Hz)
f = 5;              % Sine wave frequency (Hz)
A = 1;              % Amplitude of sine wave
t = 1;              % Signal duration (seconds)

% Create the time vector
n = 0:(1/fs):t;

% Generate the original sine wave
x = A * sin(2*pi*f*n);

% Generate random noise
y = rand(size(n));

% Add noise to the original signal
z = x + y;

% Define the moving-average filter
windowSize = 100;                           % Filter window length
b = (1/windowSize) * ones(1,windowSize);    % Filter coefficients
a = 1;                                      % Denominator coefficient

% Apply the moving-average filter to the noisy signal
z_filtered = filter(b,a,z);

% Plot the original, noisy, and filtered signals
figure;

% Original sine wave
subplot(3,1,1);
plot(n,x);
title('Original Sine Wave');
grid('on');

% Noisy signal
subplot(3,1,2);
plot(n,z);
title('Noisy Signal');
grid('on');

% Filtered signal
subplot(3,1,3);
plot(n,z_filtered);
title('Filtered Signal');
grid('on');