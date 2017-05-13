function [ result ] = UsedInRow( a , row , i )
    for col = 1:9
        if a(row,col)==i
            result = true;
            return;
        end
    end
    result = false;
    return;
end

