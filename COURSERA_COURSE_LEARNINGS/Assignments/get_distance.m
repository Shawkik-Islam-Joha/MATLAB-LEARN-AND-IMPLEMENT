function distance = get_distance(city1, city2)
    [~,~,raw] = xlsread("Distances.xlsx");

    cities = raw(1,2:end);

    distances = cell2mat(raw(2:end,2:end));

    id1 = find(strcmp(cities,city1),1);
    id2 = find(strcmp(cities,city2),1);

    if isempty(id1) || isempty(id2)
        distance = -1;
        return;
    end

    distance = distances(id1,id2);
end