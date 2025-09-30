% This script allows the user to input two vectors and 
% then compute their dot product, cross product, sum, 
% and difference
clear
vA = input('Enter vector A in the format [x y z]... \n > ');
if isempty(vA); vA = [0 0 0]; end    % if the input is 
                                     % entered incorrectly set the vector to 0
vB = input('Enter vector B in the format [x y z]... \n > ');
if isempty(vB); vB = [0 0 0]; end
disp('Magnitude of A:')
disp(norm(vA))            % norm finds the magnitude of a 
                          % multi-dimensional vector
disp('Magnitude of B:')
disp(norm(vB))
disp('Unit vector in direction of A:')
disp(vA/norm(vA))         % unit vector is the vector 
                          % divided by its magnitude
disp('Unit vector in direction of B:')
disp(vB/norm(vB))
disp('Sum A+B:')
disp(vA+vB)
disp('Difference A-B:')
disp(vA-vB)
disp('Dot product (A . B):')
disp(dot(vA,vB))         % dot takes the dot product of vectors
disp('Cross product (A x B):')
disp(cross(vA,vB))       % cross takes cross product of vectors