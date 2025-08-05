% Create a variable and arrays
x = 10;
v = [1, 4, 9, 16];
m = [1, 2, 3, 4];

third = v(3);               % Access third element of v
v(2) = 8;                   % Modify an element
v = v + 5;                  % Add 5 to all elements

A = [v;m];                  % Create a 2 by 4 matrix
B = rand(4,2);              % Random 4 by 2 matrix

C = A * B;                  % Matrix multiplication

D = v + m;                  % Add v and m
P = v .* m;                 % Multiplies corresponding elements

Q = A';                     % Transpose of A

F = [3,4;5,6];
F = F^2;                    % Matrix multiplication: A*A

% det(A) — Determinant of matrix.
% inv(A) — Inverse of a matrix (if it exists).
% size(A) — Matrix dimensions.
% sum(A) — Sum along an array dimension.
% eig(A) — Eigenvalues and eigenvectors.






