% Define the transfer function
num = [2 0 4]; % Coefficients of numerator: 2s^2 + 4
den = [1 4 16]; % Coefficients of denominator: s^2 + 4s + 16

% Define the frequency range (in rad/s)
w = logspace(-1, 2, 1000); % Frequencies from 0.1 to 100 rad/s

% Compute the frequency response
[h, w] = freqs(num, den, w); % h is the complex frequency response

% Plot the magnitude in dB
subplot(2,1,1); % First subplot for magnitude
semilogx(w, 20*log10(abs(h))); % Magnitude in dB
grid on;
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
title('Frequency Response of H(s)');

% Plot the phase in degrees
subplot(2,1,2); % Second subplot for phase
semilogx(w, angle(h)*180/pi); % Phase in degrees
grid on;
xlabel('Frequency (rad/s)');
ylabel('Phase (degrees)');