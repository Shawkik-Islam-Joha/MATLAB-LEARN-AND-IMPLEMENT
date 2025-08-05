function matrix = sparse2matrix(cellvec)
    matrix = cellvec{2}*ones(cellvec{1}(1),cellvec{1}(2));
    for i = 3:length(cellvec)
        matrix(cellvec{i}(1),cellvec{i}(2)) = cellvec{i}(3);
    end
end


% I could have done this too

% function M = sparse2matrix(cellvec)
%     sz = cellvec{1};
%     val = cellvec{2};
%     M = val*ones(sz);
%     for i = 3:length(cellvec)
%         el = cellvec{i};
%         M(el(1), el(2)) = el(3);
%     end
% end