function mainFunc(x)
    y = x + 2;   % 'y' is local to mainFunc
    % Nested function: can access 'y'
    function nestedFunc()
        disp(y); % Okay! Nested functions share parent workspace
    end
    nestedFunc(); % Works fine
end

% Attempting to use 'y' here would cause an error!
