function coded = caesar(text, shift)

ascii_min = 32;  % Space
ascii_max = 126; % ~
ascii_range = ascii_max - ascii_min + 1;

% Initialize output
coded = char(zeros(size(text)));

% Process each character
for i = 1:length(text)
    ascii_val = double(text(i));
    
    % Only process if character is in visible ASCII range
    if ascii_min <= ascii_val && ascii_val <= ascii_max
        % Apply shift and wrap around using modulo
        shifted_val = mod(ascii_val - ascii_min + shift, ascii_range) + ascii_min;
        coded(i) = char(shifted_val);
    else
        % Keep non-visible ASCII characters unchanged
        coded(i) = text(i);
    end
end
end