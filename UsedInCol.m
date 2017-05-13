function [ result ] = UsedInCol( a,col,i )
    for row = 1:9
        if a(row,col)==i
            result = true;
            return;
        end
    end
    result = false;
    return;
end

