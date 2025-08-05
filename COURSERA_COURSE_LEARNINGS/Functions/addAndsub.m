% MainFunction
function [a,b] = addAndsub(r,s)
a = add(r,s);       % Calls sub function 1
b = sub(r,s);       % Calls sub function 2
end

% Subfunction 1
function x = add(p,q)
x = p + q;
end

% Subfunction 2
function y = sub(p,q)
y = p - q;
end



