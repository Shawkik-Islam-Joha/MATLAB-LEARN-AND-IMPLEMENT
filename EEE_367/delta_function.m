clc;
clear;
close all;

%% Parameters
Ts = 0.5;                 % Sampling period
fs = 1/Ts;                % Sampling frequency

% Continuous-time axis
t = -5:0.001:5;

%% Define the continuous-time signal g(t)
g = exp(-0.08*t.^2).*cos(2*pi*1.0*t);

%% Sampling instants
n = -10:10;
tn = n*Ts;

%% Samples g(nTs)
gn = exp(-0.08*tn.^2).*cos(2*pi*1.0*tn);

%% Plot
figure;

% ---------------------------------------------------------
% 1. Original continuous-time signal
% ---------------------------------------------------------
subplot(3,1,1);

plot(t,g,'LineWidth',1.5);
grid on;
hold on;

% Show sampling instants
stem(tn,gn,'filled');

xlabel('Time (s)');
ylabel('g(t)');
title('Original Continuous-Time Signal g(t)');
legend('g(t)','Samples g(nT_s)');
xlim([-5 5]);

% ---------------------------------------------------------
% 2. Sample values
% ---------------------------------------------------------
subplot(3,1,2);

stem(tn,gn,'filled','LineWidth',1.2);
grid on;

xlabel('Time (s)');
ylabel('g(nT_s)');
title('Samples of g(t) at t = nT_s');
xlim([-5 5]);

% ---------------------------------------------------------
% 3. Ideal sampled signal
% ---------------------------------------------------------
subplot(3,1,3);

stem(tn,gn,'filled','LineWidth',1.5);
grid on;

xlabel('Time (s)');
ylabel('g_\delta(t)');
title('Ideal Sampled Signal  g_\delta(t) = \Sigma g(nT_s)\delta(t-nT_s)');
xlim([-5 5]);