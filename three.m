function [z] = three(a)
k=0;
for i=1:17
pic = imread(['E:\3\' num2str(i) '.jpg']);
c=imsubtract(a,pic);
result=isequal(c,zeros(60,30));
%disp(result);
if result==1
    k=1;
end
end
z=k;
end