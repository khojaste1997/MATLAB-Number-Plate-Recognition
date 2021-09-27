function [z] = horof(a)
k='0';
for i=1:26
pic = imread(['E:\char\' num2str(i) '.jpg']);
c=imsubtract(a,pic);
%figure;imshow(c);
result=isequal(c,zeros(60,30));
%disp(result);
if result==1
    if (i==1 || i==2)
        k='alef';
    elseif i==3
        k='be';
    elseif i==4
        k='pe';
    elseif i==5
        k='te';
    elseif i==6
        k='se';
    elseif i==7
        k='jim';
    elseif (i==8 || i ==25)
        k='dal';
    elseif i==9
        k='ein';
    elseif i==10
        k='fe';
    elseif i==11
        k='kaf';
    elseif i==12
        k='gaf';
    elseif i==13
        k='lam';
    elseif i==14
        k='ghaf';
    elseif i==15
        k='non';
    elseif i==16
        k='d';
    elseif i==17
        k='s';
    elseif i==18
        k='sad';
    elseif i==19
        k='shin';
    elseif i==20
        k='sin';
    elseif (i==22||i==21||i==26)
        k='ta';
    elseif i==23
        k='vilcher';
    elseif i==24
        k='ze';
    end
        
end
end
z=k;
end