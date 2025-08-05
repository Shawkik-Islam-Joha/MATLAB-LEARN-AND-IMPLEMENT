function valid = valid_date_checker(year,month,day)
    valid = false;
    isLeap = false;

    % Checking if all are positive integers
    if ~(isnumeric(year) && isscalar(year) && year > 0 && rem(year,1) == 0)
        return;
    end
    if ~(isnumeric(month) && isscalar(month) && month > 0 && rem(month,1) == 0)
        return;
    end
    if ~(isnumeric(day) && isscalar(day) && day > 0 && rem(day,1) == 0)
        return;
    end

    % Checking Month range
    if month < 1 || month > 12
        return;
    end

    % Setting days in month for non leap year
    daysinMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    if rem(year,400)==0
        isLeap = true;
    elseif rem(year,100)==0
        isLeap = false;
    elseif rem(year,4)==0
        isLeap = true;
    end

    % Updating days in month for leap year
    if isLeap
        daysinMonth(2) = 29;
    end

    % Final check of days
    if day <= daysinMonth(month) 
        valid = true;
    end
end