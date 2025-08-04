function output = echo_gen(input, fs, delay, amp)
    % echo_gen - Adds an echo to a mono audio signal
    %
    % Syntax: output = echo_gen(input, fs, delay, amp)
    %
    % Inputs:
    %   input - Column vector of audio samples (-1 to 1)
    %   fs    - Sampling frequency (samples per second)
    %   delay - Echo delay in seconds
    %   amp   - Amplitude of the echo (e.g., 0.5 for half as loud)
    %
    % Output:
    %   output - Audio vector with echo

    % Step 1: Calculate the delay in number of samples
    delay_samples = round(delay * fs);

    % Step 2: Create the echo signal
    echo = zeros(length(input) + delay_samples, 1);  % Allocate zero vector
    echo(delay_samples + 1:end) = amp * input;       % Echo starts after delay

    % Step 3: Zero-pad original input to match echo vector length
    original = zeros(length(echo), 1);
    original(1:length(input)) = input;

    % Step 4: Add the echo to the original signal
    output = original + echo;

    % Step 5: Normalize if values go outside [-1, 1]
    max_val = max(abs(output));
    if max_val > 1
        output = output / max_val;  % Scale down to fit within [-1, 1]
    end
end
