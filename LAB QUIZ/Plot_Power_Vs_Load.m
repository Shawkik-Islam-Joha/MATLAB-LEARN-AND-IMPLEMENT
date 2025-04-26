% Define circuit parameters
V1 = 10; % Voltage source (10 V)
R1 = 10; % Source resistance (10 ohms)

% Define the range of load resistance (R_L)
RL = linspace(0, 50, 1000); % R_L from 0 to 50 ohms, 1000 points

% Calculate current and power
I = V1 ./ (R1 + RL); % Current I = V1 / (R1 + RL)
PL = (I.^2) .* RL; % Power P_L = I^2 * R_L

% Plot the power vs. load resistance,green line
plot(RL, PL, 'G-', 'LineWidth', 2);
grid on;
xlabel('Load Resistance R_L (ohms)');
ylabel('Power to Load P_L (Watts)');
title('Power to Load vs. Load Resistance');