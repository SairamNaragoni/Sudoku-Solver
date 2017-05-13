function [ result , a ] = SolveSudoku( a )
row = 1;
col = 1;
for i=1:9
    [ o, row , col] = Unassigned(a,row,col);
    if ~o
        result = true;
        return;
    end
    if isSafe(a,row,col,i)
        a(row,col) = i;
        [o , a] = SolveSudoku(a);
        conv_row = char(row+96);
        z = strcat(conv_row,num2str(col));
        h = findobj('Tag',z);
        set(h,'String',a(row,col));
        
        pause(0.001);
        if o
            result = true;
            return;
        end
        a(row,col) = 0;
    end
end
result = false;
return;
end

