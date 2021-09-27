
function [z] = PlakImage()
p0=imread('E:\ov7670\test 1.jpg');
%figure,imshow(p0);%1
%% tabdil CLASS va SHEKL
p =rgb2gray(p0);
%figure,imshow(p);%2
p=im2double(p);
%figure,imshow(p)%3
%% FILTER gozari
f=fspecial('gaussian');
pf=imfilter(p,f,'replicate');
%figure,imshow(pf)%4
%% miangin giri

Pm=mean2(pf);   % Average eleman matris

Pv=((std2(pf))^2); % variance E yek  M-by-N matris ' square' E halat standard ast - pf tasvire replicate shude ast
T=Pm+Pv;
%%
% taerife astane�
[m n]=size(pf);
for j=1:n
for i=1:m
if pf(i,j)>T;
pf(i,j)=1;
else
pf(i,j)=0;
end
end
end
%% LABE YABI
ps=edge(pf,'sobel');
%figure,imshow(ps)%5
%% SAYESH TASVIR
pd=imdilate(ps,strel('diamond',1)); %SAYESH
pe=imerode(pd,strel('diamond',1)); % SAYESH
%%HOFRE YABI
pl=imfill(pe,'holes');  %yaftane hofre ha
%figure,imshow(pl);%6
[m n]=size(pl);
%% barchasb gozary
pll=bwlabel(pl);
%figure,imshow(pll);%7
stat=regionprops(pll,'Area','Extent','BoundingBox','Image','Orientation','Centroid');
index = (find([stat.Area] == max([stat.Area]))); %meghdare barchasb dakhele bozorgtarin masahat ra mikhanad
ppout=stat(index).Image;
%figure,imshow(ppout);%8
%% yaftane mokhtasate pelak az nemone bainery

x1 = floor(stat(index).BoundingBox(1)); %shomare stone awalin pixel (B = floor(A) rounds the elements of A to the nearest integers less than or equal to A) 
x2 = ceil(stat(index).BoundingBox(3));  %pahnaye abject dar sathe ofoghi(B = ceil(A) rounds the elements of A to the nearest integers greater than or equal to A)
y1 = ceil(stat(index).BoundingBox(2));  %shomare satre avalin pixel(B = ceil(A) rounds the elements of A to the nearest integers greater than or equal to A)
y2 = ceil(stat(index).BoundingBox(4));  %pahnaye abject dar sathe amodi(B = ceil(A) rounds the elements of A to the nearest integers greater than or equal to A)
bx=[y1 x1 y2 x2];  %MOKHTASAT e KOLI
ppc=imcrop(p0(:,:,:),[x1,y1,x2,y2]);
%figure,imshow(ppc)%9
%%
z=ppc;
end