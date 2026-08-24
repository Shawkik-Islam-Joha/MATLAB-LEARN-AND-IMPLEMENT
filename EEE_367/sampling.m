clc;
clear;
close all;

%% Parameters
W = 100;              % Bandwidth = 100 Hz
fs = 2*W;             % Sampling frequency = 2W
Ts = 1/fs;

f = -500:0.1:500;

%% Original triangular spectrum G(f)
G = zeros(size(f));

idx = abs(f) <= W;

% Triangular spectrum
G(idx) = 1 - abs(f(idx))/W;

%% Sampled spectrum
Gs = zeros(size(f));

% Add shifted copies of G(f)
for k = -3:3
    Gs = Gs + fs * ...
        max(1 - abs(f-k*fs)/W, 0);
end

%% Plot original spectrum
figure;

subplot(2,1,1);

plot(f,G,'LineWidth',2);
grid on;

xlabel('Frequency (Hz)');
ylabel('G(f)');
title('Original Spectrum G(f)');

xlim([-350 350]);
ylim([0 1.2]);

%% Plot sampled spectrum
subplot(2,1,2);

plot(f,Gs,'LineWidth',2);
grid on;

xlabel('Frequency (Hz)');
ylabel('G_s(f)');
title(['Sampled Spectrum, f_s = 2W = ',num2str(fs),' Hz']);

xlim([-500 500]);
ylim([0 fs*1.2]);