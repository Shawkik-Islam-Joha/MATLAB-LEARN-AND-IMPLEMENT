%% Interactive Time Shift Visualization
% EEE 365 DSP
% Demonstrates delay x(n-k) and advance x(n+k)

clear;
close all;
clc;

%% Original Signal
n = -10:10;
x = [zeros(1,8) 1 2 3 4 3 2 1 zeros(1,6)];

%% Create Figure
fig = figure('Name','Time Shift Visualization',...
    'NumberTitle','off',...
    'Position',[200 100 900 600]);

%% Axes
ax1 = subplot(2,1,1);
hOrig = stem(ax1,n,x,'filled','LineWidth',1.5);
grid(ax1,'on');
title(ax1,'Original Signal  x(n)');
xlabel(ax1,'n');
ylabel(ax1,'Amplitude');
xlim(ax1,[-10 10]);
ylim(ax1,[0 5]);

ax2 = subplot(2,1,2);
hShift = stem(ax2,n,x,'filled','r','LineWidth',1.5);
grid(ax2,'on');
xlabel(ax2,'n');
ylabel(ax2,'Amplitude');
xlim(ax2,[-10 10]);
ylim(ax2,[0 5]);

%% Popup Menu
popup = uicontrol('Style','popupmenu',...
    'String',{'Delay  x(n-k)','Advance  x(n+k)'},...
    'Position',[40 560 180 30],...
    'Callback',@updatePlot);

%% Slider
slider = uicontrol('Style','slider',...
    'Min',0,...
    'Max',8,...
    'Value',2,...
    'SliderStep',[1/8 1/8],...
    'Position',[260 565 300 20],...
    'Callback',@updatePlot);

%% Text
txt = uicontrol('Style','text',...
    'Position',[600 555 200 30],...
    'FontSize',12,...
    'String','k = 2');

%% Initial Plot
updatePlot();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function updatePlot(~,~)

    popup = findobj('Style','popupmenu');
    slider = findobj('Style','slider');
    txt = findobj('Style','text');

    k = round(slider.Value);
    slider.Value = k;

    txt.String = ['k = ' num2str(k)];

    n = -10:10;
    x = [zeros(1,8) 1 2 3 4 3 2 1 zeros(1,6)];

    ax = findall(gcf,'type','axes');

    % ax(1) is lower subplot
    cla(ax(1));

    if popup.Value == 1
        % Delay
        stem(ax(1),n+k,x,'filled','r','LineWidth',1.5);
        title(ax(1),sprintf('Delayed Signal   x(n-%d)',k));
    else
        % Advance
        stem(ax(1),n-k,x,'filled','m','LineWidth',1.5);
        title(ax(1),sprintf('Advanced Signal   x(n+%d)',k));
    end

    grid(ax(1),'on');
    xlabel(ax(1),'n');
    ylabel(ax(1),'Amplitude');
    xlim(ax(1),[-10 10]);
    ylim(ax(1),[0 5]);

    drawnow;

end