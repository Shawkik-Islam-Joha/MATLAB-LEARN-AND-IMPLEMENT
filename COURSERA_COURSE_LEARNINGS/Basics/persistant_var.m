function count = persistant_var()
    persistent numCalls
    if isempty(numCalls)
        numCalls = 0;               % Initialize once, on the first call
    end
    numCalls = numCalls + 1;         % Increment the counter each time the function is called
    count = numCalls;                % Return the current count
end