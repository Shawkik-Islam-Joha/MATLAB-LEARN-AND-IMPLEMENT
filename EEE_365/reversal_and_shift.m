%% Example 2.1.3
% Demonstration of x(-n) and x(-n+2)

clear;
close all;
clc;

%% Original Signal
n = -5:5;

% Example signal (replace with your textbook signal)
x = [0 1 2 4 3 2 1 3 2 1 0];

%% Figure
figure('Color','w','Position',[100 100 1000 600]);

%% STEP 1 : Original Signal
subplot(3,1,1)
stem(n,x,'filled','LineWidth',2)
grid on
title('Step 1 : Original Signal  x(n)')
xlabel('n')
ylabel('Amplitude')
xlim([-7 7])
ylim([0 max(x)+1])

pause(2)

%% STEP 2 : Reflection
subplot(3,1,2)

% Reflect about n=0
stem(-n,x,'filled','r','LineWidth',2)

grid on
title('Step 2 : Reflection  x(-n)')
xlabel('n')
ylabel('Amplitude')
xlim([-7 7])
ylim([0 max(x)+1])

pause(2)

%% STEP 3 : Shift Right by 2
subplot(3,1,3)

% Shift reflected signal right by 2
stem(-n+2,x,'filled','m','LineWidth',2)

grid on
title('Step 3 : Shift Right by 2  →  x(-n+2)')
xlabel('n')
ylabel('Amplitude')
xlim([-7 7])
ylim([0 max(x)+1])