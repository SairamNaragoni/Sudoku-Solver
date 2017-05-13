function [ result ] = UsedInBox( a , StartRow , StartCol,i )
    for row = 1:3
        for col = 1:3
            if a(row+StartRow,col+StartCol)==i
                result = true;
                return;
            end
        end
    end
    result = false;
    return;
end

