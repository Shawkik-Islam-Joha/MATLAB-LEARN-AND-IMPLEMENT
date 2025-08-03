function summa = halfsum(M)
    [row,col] = size(M);
    summa = 0;
    for x = 1:row
        for y = 1:col
            if y>=x && y<=col
                summa = summa + M(x,y);
            end
        end
    end
    return;
end
