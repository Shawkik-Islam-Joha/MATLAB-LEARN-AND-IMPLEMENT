n = 1000;
squares = zeros(1, n); % Preallocate a row vector of zeros

for i = 1:n
    squares(i) = i^2;
end

rows = 100;
cols = 50;
A = zeros(rows, cols); % Preallocate a matrix

for r = 1:rows
    for c = 1:cols
        A(r, c) = r * c;
    end
end
