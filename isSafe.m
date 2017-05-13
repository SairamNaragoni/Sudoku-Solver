function [ result ] = isSafe( a,row,col,i )
    x = ~UsedInRow(a,row,i);
    y = ~UsedInCol(a,col,i);
    z = ~UsedInBox(a,(row-1)-mod((row-1),3),(col-1)-mod((col-1),3),i);
    result =  x && y && z;
    return;
end

