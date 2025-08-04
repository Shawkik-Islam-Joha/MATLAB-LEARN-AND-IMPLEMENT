function indices = saddle(M)
    [rows, cols] = size(M);
    indices = [];
    
    for i = 1:rows
        for j = 1:cols
            row_max = max(M(i, :));
            if M(i, j) >= row_max
                col_min = min(M(:, j));
                if M(i, j) <= col_min
                    indices = [indices; [i, j]];
                end
            end
        end
    end
    
    if isempty(indices)
        indices = [];
    end
end