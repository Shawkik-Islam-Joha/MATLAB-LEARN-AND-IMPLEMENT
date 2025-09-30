% This script allows the user to input a coordinate in either
% rectangular, cylindrical, or spherical coordinates and 
% retrieve the answer in the other coordinate systems
clear

% Prompt the user for the coordinate system
disp('Enter the coordinate system of the input coordinate');
coord_sys = input('(r for rectangular, c for cylindrical, s for spherical)... \n > ', 's');

% Set default to 'r' if input is empty or invalid
if isempty(coord_sys) || ~ismember(coord_sys, {'r', 'c', 's'})
    coord_sys = 'r';
    disp('Invalid input. Defaulting to rectangular coordinates.');
end

if coord_sys == 'r'
    % Prompt for rectangular coordinates
    disp('Enter the rectangular coordinate in the format [x y z]:');
    crd = input('> ');
    
    % Check if input is empty or invalid
    if isempty(crd)
        crd = [0 0 0];
        disp('Empty input. Defaulting to [0 0 0].');
    elseif ~isvector(crd) || length(crd) ~= 3
        crd = [0 0 0];
        disp('Invalid input. Defaulting to [0 0 0].');
    end
    
    % Convert to cylindrical coordinates [rho phi z]
    rho = sqrt(crd(1)^2 + crd(2)^2);
    phi = atan2(crd(2), crd(1));
    z = crd(3);
    disp('Cylindrical coordinates [rho phi(rad) z]:')
    disp([rho phi z])
    
    % Convert to spherical coordinates [rho phi theta]
    r = norm(crd);
    if r == 0
        theta = 0; % Define theta as 0 when r=0 to avoid division by zero
    else
        theta = acos(crd(3)/r);
    end
    disp('Spherical coordinates [rho phi(rad) theta(rad)]:')
    disp([r phi theta])
    
elseif coord_sys == 'c'
    % Prompt for cylindrical coordinates
    disp('Enter the cylindrical coordinate in the format [rho phi z]:');
    crd = input('> ');
    
    % Check if input is empty or invalid
    if isempty(crd)
        crd = [0 0 0];
        disp('Empty input. Defaulting to [0 0 0].');
    elseif ~isvector(crd) || length(crd) ~= 3
        crd = [0 0 0];
        disp('Invalid input. Defaulting to [0 0 0].');
    elseif crd(1) < 0
        crd(1) = 0;
        disp('Negative rho is invalid. Setting rho to 0.');
    end
    
    % Convert to rectangular coordinates [x y z]
    x = crd(1) * cos(crd(2));
    y = crd(1) * sin(crd(2));
    z = crd(3);
    disp('Rectangular coordinates [x y z]:')
    disp([x y z])
    
    % Convert to spherical coordinates [rho phi theta]
    r = sqrt(crd(1)^2 + crd(3)^2);
    phi = crd(2);
    if r == 0
        theta = 0; % Define theta as 0 when r=0 to avoid division by zero
    else
        theta = acos(crd(3)/r);
    end
    disp('Spherical coordinates [rho phi(rad) theta(rad)]:')
    disp([r phi theta])
    
else % Spherical coordinates
    % Prompt for spherical coordinates
    disp('Enter the spherical coordinate in the format [rho phi theta]:');
    crd = input('> ');
    
    % Check if input is empty or invalid
    if isempty(crd)
        crd = [0 0 0];
        disp('Empty input. Defaulting to [0 0 0].');
    elseif ~isvector(crd) || length(crd) ~= 3
        crd = [0 0 0];
        disp('Invalid input. Defaulting to [0 0 0].');
    elseif crd(1) < 0
        crd(1) = 0;
        disp('Negative rho is invalid. Setting rho to 0.');
    end
    
    % Convert to rectangular coordinates [x y z]
    x = crd(1) * sin(crd(3)) * cos(crd(2));
    y = crd(1) * sin(crd(3)) * sin(crd(2));
    z = crd(1) * cos(crd(3));
    disp('Rectangular coordinates [x y z]:')
    disp([x y z])
    
    % Convert to cylindrical coordinates [rho phi z]
    rho = crd(1) * sin(crd(3));
    phi = crd(2);
    z = crd(1) * cos(crd(3));
    disp('Cylindrical coordinates [rho phi(rad) z]:')
    disp([rho phi z])
end