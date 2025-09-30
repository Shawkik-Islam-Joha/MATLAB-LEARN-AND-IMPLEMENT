% This script allows the user to input a non-variable vector in rectangular
% coordinates and obtain its components in cylindrical and spherical
% coordinate systems, based on the vector's observation point.
clear

% Prompt the user for the vector and point
disp('Enter the rectangular vector in the format [x y z]:');
v = input('> ');
if isempty(v)
    v = [0 0 0];
    disp('Empty vector input. Defaulting to [0 0 0].');
elseif ~isvector(v) || length(v) ~= 3
    v = [0 0 0];
    disp('Invalid vector input. Defaulting to [0 0 0].');
end

disp('Enter the location of the vector in the format [x y z]:');
p = input('> ');
if isempty(p)
    p = [0 0 0];
    disp('Empty point input. Defaulting to [0 0 0].');
elseif ~isvector(p) || length(p) ~= 3
    p = [0 0 0];
    disp('Invalid point input. Defaulting to [0 0 0].');
end

% Cylindrical components
disp('Cylindrical components [vrho vphi vz]:');
phi = atan2(p(2), p(1));
% Transformation matrix: rectangular to cylindrical [rho, phi, z]
cyl_p = [cos(phi) sin(phi) 0; ...
         -sin(phi) cos(phi) 0; ...
         0 0 1];
% Convert vector to cylindrical components
v_cyl = (cyl_p * v')';
disp(v_cyl)

% Spherical components
disp('Spherical components [vr vtheta vphi]:');
% Calculate spherical angles
rho = sqrt(p(1)^2 + p(2)^2 + p(3)^2);
if rho == 0
    theta = 0;
    phi = 0;
    disp('Point at origin. Setting theta = 0, phi = 0.');
else
    theta = acos(p(3) / rho);
    phi = atan2(p(2), p(1));
end
% Transformation matrix: rectangular to spherical [r, theta, phi]
sph_p = [sin(theta)*cos(phi) sin(theta)*sin(phi) cos(theta); ...
         cos(theta)*cos(phi) cos(theta)*sin(phi) -sin(theta); ...
         -sin(phi) cos(phi) 0];
% Convert vector to spherical components
v_sph = (sph_p * v')';
disp(v_sph)