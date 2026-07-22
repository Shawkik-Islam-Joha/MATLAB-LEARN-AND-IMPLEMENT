clc;
clear;
close all;

%% Given Data
Vs = 220;          % DC input voltage (V)
R = 10;            % Resistance (Ohm)
L = 31.5e-3;       % Inductance (H)
C = 112e-6;        % Capacitance (F)
f = 60;            % Fundamental frequency (Hz)

w = 2*pi*f;

%% Time Axis
T = 1/f;
t = linspace(0,2*T,2000);    % Two cycles

%% Harmonic Orders
n = [1 3 5 7];

io = zeros(size(t));

figure(1);
hold on;
grid on;

for k = 1:length(n)

    h = n(k);

    %% Fourier voltage magnitude of square wave
    Vh = 4*Vs/(h*pi);

    %% Load impedance
    Xl = h*w*L;
    Xc = 1/(h*w*C);

    Zh = R + 1i*(Xl - Xc);

    %% Current magnitude and phase
    Ih = Vh/abs(Zh);
    phi = angle(Zh);

    %% Harmonic current
    ih = Ih*sin(h*w*t - phi);

    %% Add to total current
    io = io + ih;

    %% Plot individual harmonic
    plot(t,ih,'LineWidth',1.5,...
        'DisplayName',['Harmonic ' num2str(h)]);

end

xlabel('Time (s)');
ylabel('Current (A)');
title('Current Harmonics up to 7^{th}');
legend show;

%% Plot Total Load Current
figure(2)
plot(t,io,'b','LineWidth',2);
grid on;
xlabel('Time (s)');
ylabel('Current (A)');
title('Load Current i_o(t) Including up to 7^{th} Harmonic');

%% Plot Fundamental Current
h = 1;

V1 = 4*Vs/pi;

Xl = w*L;
Xc = 1/(w*C);

Z1 = R + 1i*(Xl-Xc);

I1 = V1/abs(Z1);
phi1 = angle(Z1);

io1 = I1*sin(w*t-phi1);

figure(3)
plot(t*1000,io1,'r','LineWidth',2);
grid on;
hold on;

xlabel('Time (ms)');
ylabel('Current (A)');
title('Fundamental Load Current i_{o1}(t)');

%% Conduction intervals (from textbook Example 6.3)

Q1_end = 5.694;
D1_end = 8.333;
Q2_end = 14.027;
D2_end = 16.667;

%% Vertical dashed lines
xline(Q1_end,'k--');
xline(D1_end,'k--');
xline(Q2_end,'k--');
xline(D2_end,'k--');

%% Arrow level
yl = ylim;
yArrow = yl(1)+0.12*(yl(2)-yl(1));

%% Q1
annotation('doublearrow',...
    [0.13 0.39],...
    [0.17 0.17]);
text((0+Q1_end)/2,yArrow,'Q_1 on',...
    'HorizontalAlignment','center','FontSize',11);

%% D1
annotation('doublearrow',...
    [0.39 0.50],...
    [0.17 0.17]);
text((Q1_end+D1_end)/2,yArrow,'D_1 on',...
    'HorizontalAlignment','center','FontSize',11);

%% Q2
annotation('doublearrow',...
    [0.50 0.81],...
    [0.17 0.17]);
text((D1_end+Q2_end)/2,yArrow,'Q_2 on',...
    'HorizontalAlignment','center','FontSize',11);

%% D2
annotation('doublearrow',...
    [0.81 0.95],...
    [0.17 0.17]);
text((Q2_end+D2_end)/2,yArrow,'D_2 on',...
    'HorizontalAlignment','center','FontSize',11);

%% Time labels
text(Q1_end,0.8,'5.694 ms',...
    'HorizontalAlignment','center');

text(D1_end,3,'8.333 ms',...
    'HorizontalAlignment','center');

text(D2_end,0.8,'16.667 ms',...
    'HorizontalAlignment','center');