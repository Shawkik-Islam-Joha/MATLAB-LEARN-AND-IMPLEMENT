clc;
clear;
close all;

fc = 300;      % Carrier frequency (kHz)
BW = 2;        % Message bandwidth (kHz)

figure;
hold on;
grid on;

% Lower Sideband
plot([fc-BW fc],[0.5 0.5],'b','LineWidth',8);

% Upper Sideband
plot([fc fc+BW],[0.5 0.5],'r','LineWidth',8);

% Carrier
stem(fc,1,'k','filled','LineWidth',2);

xlabel('Frequency (kHz)');
ylabel('Amplitude');
title('AM Spectrum');

xlim([297 303]);
ylim([0 1.2]);

text(299,0.62,'LSB');
text(300,1.05,'Carrier');
text(301,0.62,'USB');

hold off;