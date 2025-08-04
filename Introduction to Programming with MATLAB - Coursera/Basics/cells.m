% Create a cell array with various types of data
myCell = {'Hello', 3.14, [10, 20, 30]; 'World', magic(3), {1,2,3}};

% Access and display specific cell contents
fprintf('Cell (1,1): %s\n', myCell{1,1});      % 'Hello'
fprintf('Cell (1,2): %.2f\n', myCell{1,2});    % 3.14
fprintf('Cell (2,2) is a matrix:\n');
disp(myCell{2,2});                             % 3x3 magic square

% Access a nested cell array inside cell (2,3)
nestedCell = myCell{2,3};
disp('Nested cell contents:');
disp(nestedCell);                           % displays elements 1, 2, 3
