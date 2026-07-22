clc;
clear;
close all;

%% Original Analog Signal
fa = 1;                  % Signal frequency (Hz)
t = 0:0.001:2;           % Continuous time
x = sin(2*pi*fa*t);

%% Sampling
fs = 10;                 % Sampling frequency
Ts = 1/fs;
n = 0:Ts:2;
xs = sin(2*pi*fa*n);

%% Quantization
L = 8;                   % Number of quantization levels
xmin = -1;
xmax = 1;

step = (xmax-xmin)/(L-1);

% Quantization index (0 to L-1)
index = round((xs-xmin)/step);

% Limit index
index(index<0)=0;
index(index>L-1)=L-1;

% Quantized signal
xq = xmin + index*step;

%% Coding
bits = ceil(log2(L));    % Number of bits required
binaryCode = dec2bin(index,bits);

%% Plotting
figure('Position',[100 100 900 800]);

%% Original Analog Signal
subplot(4,1,1)
plot(t,x,'b','LineWidth',2)
grid on
title('Original Analog Signal')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-1.2 1.2])

%% Sampling
subplot(4,1,2)
plot(t,x,'k','LineWidth',1.2)
hold on
stem(n,xs,'r','filled','LineWidth',1.5)
grid on
title('Sampling')
xlabel('Time (s)')
ylabel('Amplitude')
legend('Analog Signal','Samples')
ylim([-1.2 1.2])

%% Quantization
subplot(4,1,3)
stem(n,xs,'b','filled','LineWidth',1.5)
hold on
stairs(n,xq,'r','LineWidth',2)
grid on
title('Quantization')
xlabel('Time (s)')
ylabel('Amplitude')
legend('Sampled','Quantized')
ylim([-1.2 1.2])

%% Coding Visualization
subplot(4,1,4)
stem(n,xq,'filled','LineWidth',1.5)
grid on
title('Coding (Binary Representation)')
xlabel('Time (s)')
ylabel('Quantized Level')
ylim([-1.2 1.2])

% Display binary code beside each sample
for k=1:length(n)
    text(n(k),xq(k)+0.12,binaryCode(k,:),...
        'HorizontalAlignment','center',...
        'FontWeight','bold',...
        'Color','red',...
        'FontSize',9);
end