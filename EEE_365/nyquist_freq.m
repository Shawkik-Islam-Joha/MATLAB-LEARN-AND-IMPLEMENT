%% Nyquist Frequency & Aliasing Demonstration
% EEE 365 - DSP
% ----------------------------------------------------------

clear; close all; clc;

%% Parameters

Fs = 20;                  % Sampling frequency (Hz)
T = 1/Fs;
duration = 1;             % seconds

t = 0:0.001:duration;     % "continuous" time
ts = 0:T:duration;        % sampling instants

Nyquist = Fs/2;

figure('Color','w','Position',[100 100 1100 600]);

%% Sweep Analog Frequency

for F = 1:0.2:35

    %% Analog Signal
    xa = sin(2*pi*F*t);

    %% Sampled Signal
    xs = sin(2*pi*F*ts);

    %% Reconstruction (Spline)
    xr = interp1(ts,xs,t,'spline');

    %% Aliased Frequency Calculation
    F_alias = abs(mod(F + Fs/2, Fs) - Fs/2);

    %% Plot
    clf;

    %----------------------------------------------
    % Original and Sampled Signal
    %----------------------------------------------
    subplot(2,1,1)

    plot(t,xa,'b','LineWidth',2)
    hold on

    stem(ts,xs,'filled','r','LineWidth',1.2)

    plot(t,xr,'g--','LineWidth',1.8)

    grid on
    ylim([-1.4 1.4])

    legend('Original Analog','Samples','Reconstructed',...
        'Location','southoutside','Orientation','horizontal')

    xlabel('Time (s)')
    ylabel('Amplitude')

    title('Sampling Demonstration')

    %----------------------------------------------
    % Frequency Information
    %----------------------------------------------
    subplot(2,1,2)

    axis off

    text(0.05,0.85,sprintf('Sampling Frequency = %.1f Hz',Fs),...
        'FontSize',14,'FontWeight','bold')

    text(0.05,0.70,sprintf('Nyquist Frequency = %.1f Hz',Nyquist),...
        'FontSize',14,'FontWeight','bold')

    text(0.05,0.50,sprintf('Actual Signal Frequency = %.1f Hz',F),...
        'FontSize',15)

    if F <= Nyquist

        text(0.05,0.28,...
            'Status: NO ALIASING',...
            'Color',[0 0.6 0],...
            'FontSize',18,...
            'FontWeight','bold');

    else

        text(0.05,0.28,...
            'Status: ALIASING OCCURS!',...
            'Color','r',...
            'FontSize',18,...
            'FontWeight','bold');

        text(0.05,0.10,...
            sprintf('Aliased Frequency = %.2f Hz',F_alias),...
            'FontSize',16,...
            'Color','m',...
            'FontWeight','bold');
    end

    drawnow
    pause(0.2)

end