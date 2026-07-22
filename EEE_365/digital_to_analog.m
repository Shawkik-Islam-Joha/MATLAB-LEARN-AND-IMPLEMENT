clc;
clear;
close all;

%% Original Analog Signal
fa = 1;                      % Signal frequency (Hz)
t = 0:0.001:2;               % Continuous time
x = sin(2*pi*fa*t);

%% Sampling
fs = 10;                     % Sampling frequency
Ts = 1/fs;
n = 0:Ts:2;                  % Sampling instants
xs = sin(2*pi*fa*n);

%% Figure
figure('Position',[100 100 900 900])

%% 1. Original Analog Signal
subplot(4,1,1)
plot(t,x,'b','LineWidth',2)
grid on
title('Original Analog Signal')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-1.2 1.2])

%% 2. Ideal DAC (Impulse DAC)
subplot(4,1,2)
stem(n,xs,'filled','LineWidth',1.5)
grid on
title('Ideal DAC (Impulse Reconstruction)')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-1.2 1.2])

%% 3. Zero-Order Hold (ZOH)
subplot(4,1,3)
stairs(n,xs,'r','LineWidth',2)
hold on
stem(n,xs,'k.')
grid on
title('Zero-Order Hold (Staircase Reconstruction)')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-1.2 1.2])

%% 4. First-Order Hold (Linear Interpolation)
subplot(4,1,4)

% Interpolation
t_interp = linspace(0,2,1000);
x_foh = interp1(n,xs,t_interp,'linear');

plot(t_interp,x_foh,'m','LineWidth',2)
hold on
stem(n,xs,'filled')
plot(t,x,'k--','LineWidth',1)

grid on
title('First-Order Hold (Linear Interpolation)')
xlabel('Time (s)')
ylabel('Amplitude')
legend('FOH','Samples','Original Analog')
ylim([-1.2 1.2])