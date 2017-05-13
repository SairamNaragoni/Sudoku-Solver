function [ result ,row , col] = Unassigned( a ,row , col)
    for row = 1:9
        for col = 1:9
            if a(row,col)==0
                result = true;
                return;
            end
        end
    end
        result=false;
        return;
end

