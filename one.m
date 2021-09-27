function [z] = one(a)
k=0;
%  figure
%  imshow(a);
for i=1:15
%plic=imread(['E:\1\' num2str(i) '.jpg']);
pic = imread(['E:\1\' num2str(i) '.jpg']);
%figure
%imshow(pic);
c=imsubtract(a,pic);
%disp(c);
% figure
% imshow(c);
result=isequal(c,zeros(60,30));
%disp(result);
if result==1
    k=1;
end
end
z=k;
end