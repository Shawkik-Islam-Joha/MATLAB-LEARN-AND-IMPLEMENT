function charnum = char_counter(fname,character)
    fid = fopen(fname,"r");
    if fid < 0 || double(character) < 32 || double(character) > 126
        charnum = -1;
        return;
    end

    count = 0;

    while ~feof(fid)
        line = fgetl(fid);
        for x = line
            if x == character
                count = count + 1;
            end
        end
    end

    charnum = count;
    fclose(fid);

end


% This shhitt was HAAARDD