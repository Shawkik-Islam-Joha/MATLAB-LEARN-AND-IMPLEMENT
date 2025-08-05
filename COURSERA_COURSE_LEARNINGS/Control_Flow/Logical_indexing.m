A = [1, 6, 3, 9, -2];
% Create a logical index for elements greater than 3
idx = A > 3; % idx = [false, true, false, true, false]

% Extract elements greater than 3
elements = A(idx); % elements = [6, 9]

% Set elements less than zero to zero
A(A < 0) = 0; % A becomes [1, 6, 3, 9, 0]
