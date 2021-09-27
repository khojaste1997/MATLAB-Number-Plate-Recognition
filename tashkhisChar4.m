function [z]= tashkhisChar4(ch)
k=-1;
    if one(ch)
        k=1;
    elseif two(ch)
        k=2;
    elseif three(ch)
        k=3;
    elseif four(ch)
        k=4;
    elseif five(ch)
        k=5;
    elseif six(ch)
        k=6;
    elseif seven(ch)
        k=7;
    elseif eight(ch)
        k=8;
    elseif nine(ch)
        k=9;
    elseif zero(ch)
        k=0;
    end
z=k;
end