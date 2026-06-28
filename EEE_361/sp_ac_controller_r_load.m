clc;
clear;
close all;

%% Parameters
Vm = 325;          % Peak supply voltage (230 V RMS -> 325 V peak)
R = 10;            % Load resistance (Ohm)
f = 50;            % Supply frequency (Hz)

alpha_deg = 60;    % Firing angle (degrees)
alpha = deg2rad(alpha_deg);

%% Time axis (Two cycles)
theta = linspace(0,4*pi,2000);

%% Supply Voltage
vs = Vm*sin(theta);

%% Output Voltage Initialization
vo = zeros(size(theta));

%% Output Voltage Calculation
for k = 1:length(theta)

    th = mod(theta(k),2*pi);

    % Positive Half Cycle
    if (th >= alpha) && (th <= pi)
        vo(k) = Vm*sin(th);

    % Negative Half Cycle
    elseif (th >= pi+alpha) && (th <= 2*pi)
        vo(k) = Vm*sin(th);

    else
        vo(k) = 0;
    end

end

%% Output Current
io = vo/R;

%% Plot
figure('Color','w');

subplot(3,1,1)
plot(theta,vs,'b','LineWidth',2)
grid on
xlabel('\omega t (rad)')
ylabel('V_s (V)')
title('Supply Voltage')
xlim([0 4*pi])

subplot(3,1,2)
plot(theta,vo,'r','LineWidth',2)
grid on
xlabel('\omega t (rad)')
ylabel('V_o (V)')
title(['Output Voltage ( \alpha = ',num2str(alpha_deg),'^\circ )'])
xlim([0 4*pi])

subplot(3,1,3)
plot(theta,io,'m','LineWidth',2)
grid on
xlabel('\omega t (rad)')
ylabel('I_o (A)')
title('Output Current')
xlim([0 4*pi])

sgtitle('Single-Phase Full-Wave AC Voltage Controller (R Load)')