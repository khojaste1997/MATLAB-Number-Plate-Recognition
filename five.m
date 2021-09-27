function [z] = five(a)
k=0;
for i=1:10
pic = imread(['E:\5\' num2str(i) '.jpg']);
c=imsubtract(a,pic);
result=isequal(c,zeros(60,30));
%disp(result);
if result==1
    k=1;
end
end
z=k;
end