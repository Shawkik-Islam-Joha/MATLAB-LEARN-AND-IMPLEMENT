% Variables contains values
a = 5;          % Assigns the value 5 to variable a
name = 'Joha';  % Assigns text (string) to variable name
t = 1:1:1000;   % Values from 1 to 1000,steps 1

% Vectors

row_vec = [1,2,3,4,5,6];
col_vec = [1;2;3;4;5;6];

% Matrice

A = [1,2,3,4;5,6,7,8];
Z = zeros(4,4);     % Zero Matrice of 4 row 4 col
O = ones(2,2);      % 2 rows, 2 columns ; Array of ones
R = rand(4,4);      % 4 row, 4 columns ; Matrice of random val

value = A(2,3);     % Get value in row 2, column 3 of matrix A

AA = [1,2,3,4,5];
BB = [0,0,0,0,0];

C = [AA; BB];       % Vertical concatenation
D = [AA, BB];       % Horizontal concatenation


