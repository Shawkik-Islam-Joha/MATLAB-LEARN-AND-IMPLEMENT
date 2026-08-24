clc;
clear;
close all;

% Signal Generation
Fs = 100e3;
T = 1e-3;
D = 0.1;
PW = D * T;

t = -T/2 : 1/Fs : T/2;
x = (mod(t, T) < PW);

% DTFS Coefficients
N = length(x);
c = zeros(1, N);

for k = 1:N
    c(k) = sum(x .* exp(-1j * 2 * pi * (k-1) * t / T)) / N;
end

% Signal Reconstruction
x_recon = zeros(size(x));

for n = 1:N
    x_recon = x_recon + c(n) * exp(1j * 2 * pi * (n-1) * t / T);
end

% Plot Original Signal
figure;
plot(t, x, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Periodic Rectangular Pulse Train');

% Plot DTFS Coefficients
figure;
stem(0:N-1, abs(c), 'filled');
grid on;
xlabel('k');
ylabel('|C_k|');
title('Magnitude of DTFS Coefficients');

% Compare Original and Reconstructed Signals
figure;
plot(t, x, 'LineWidth', 1.5);
hold on;
plot(t, real(x_recon), '--', 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Original and Reconstructed Signals');
legend('Original Signal', 'Reconstructed Signal');