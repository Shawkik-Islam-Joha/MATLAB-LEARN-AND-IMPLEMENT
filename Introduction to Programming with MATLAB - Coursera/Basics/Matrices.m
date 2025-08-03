A = [1,2,3,4,5;5,6,7,8,9];

x = A(2,3);      % Value in second row and third column
y = A(1,end);    % Last column of first row
z = A(1,end-1);  % Second last of first row

B = zeros(4,2);
D = ones(5,5);
C = 5*ones(5,5);
F = diag([1 2 3 4]);     % Diagonal matrice
G = rand(3,4);           % Random matrice,float
H = fix(1+rand(3,4)*10); % Random integer
I = randi([5 20],3,4);   % Random integer
J = randn(1,10000000);   % Random values with SD of 1
% Reset the random generator rng('shuffle'); 







