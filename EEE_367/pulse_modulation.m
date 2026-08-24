%% Pulse Modulation Demonstration
clc;
clear;
close all;

%% Parameters
fs = 10000;              % Sampling frequency
t = 0:1/fs:1;            % Time vector

fm = 5;                  % Message frequency (Hz)
fc = 50;                 % Pulse/carrier frequency (Hz)

% Message signal
m = 0.5 + 0.5*sin(2*pi*fm*t);

%% Generate rectangular pulse train
pulse_train = 0.5*(square(2*pi*fc*t) + 1);

%% -------------------------------------------------------
% 1. PAM - Pulse Amplitude Modulation
%% -------------------------------------------------------

PAM = m .* pulse_train;

%% -------------------------------------------------------
% 2. PWM - Pulse Width Modulation
%% -------------------------------------------------------

% Generate triangular carrier
carrier = sawtooth(2*pi*fc*t, 0.5);

% Normalize carrier from -1 to +1
carrier = carrier / max(abs(carrier));

% Message signal normalized to -1 to +1
msg_norm = sin(2*pi*fm*t);

% PWM generation
PWM = msg_norm > carrier;

%% -------------------------------------------------------
% 3. PPM - Pulse Position Modulation
%% -------------------------------------------------------

% Divide the signal into individual pulse periods
samples_per_period = round(fs/fc);

PPM = zeros(size(t));

for k = 1:samples_per_period:length(t)-samples_per_period
    
    % Message value at beginning of pulse period
    msg_value = msg_norm(k);
    
    % Convert message value into position
    position = round((msg_value + 1)/2 * ...
                     (samples_per_period-1));
    
    pulse_position = k + position;
    
    if pulse_position <= length(PPM)
        PPM(pulse_position) = 1;
    end
end

%% -------------------------------------------------------
% Plotting
%% -------------------------------------------------------

figure('Name','Pulse Modulation','NumberTitle','off');

subplot(4,1,1);
plot(t,m,'LineWidth',1.5);
grid on;
xlim([0 0.4]);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot(t,PAM,'LineWidth',1.2);
grid on;
xlim([0 0.4]);
title('PAM - Pulse Amplitude Modulation');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(t,PWM,'LineWidth',1.2);
grid on;
xlim([0 0.4]);
title('PWM - Pulse Width Modulation');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,4);
stem(t,PPM,'Marker','none');
grid on;
xlim([0 0.4]);
title('PPM - Pulse Position Modulation');
xlabel('Time (s)');
ylabel('Amplitude');