function[z] = plakyabi()

%%start
%namayesh tasvir asli
% clear all
% close all
% clc
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
%% JODA SAZI akse asli pelak
ppg=imcrop(p(:,:),[x1,y1,x2,y2]);
%figure,imshow(ppg)
%% afzayesh keifiat aks
ppcg=rgb2gray(ppc);
ppcg=imadjust(ppcg, stretchlim(ppcg), [0 1]); %tozih MATLAB help  --->>> specify lower and upper limits that can be used for contrast stretching image(J = imadjust(I,[low_in; high_in],[low_out; high_out]))
ppg=im2double(ppcg);
pb=im2bw(ppg);%im2bw(I, level) tabdil be binery
%image
%figure,imshow(pb)
 
pbo=pb;

%%
pbod=imdilate(pbo,strel('line',1,0));
pbodl=imfill(pbod,'holes');
px = xor(pbodl , pbod);
pz= imresize(px, [44 250]); % 4*(57*11)=(chahar barabar size plake khodroye irani)
%% barchasb zanye plak
stat1 = regionprops(bwlabel(pz,4),'Area','Image');
index1 = (find([stat1.Area] == max([stat1.Area])));
maxarea =[stat1(index1).Area];%braye hazfe neweshteye iran va khatahaye ehtemali
pzc=bwareaopen(pz,maxarea-30); %maxarea(1,1) meghdare structur ra adres dehi mikonad,va migoyad object haye ka mte z an ra hazf konad
%% histogram plak
%v=sum(pzc);
%plot(v); 
%% biron keshidan karakterha
stat1 = regionprops(bwlabel(pz,4),'Area','Image');
index1 = (find([stat1.Area] == max([stat1.Area])));
maxarea =[stat1(index1).Area];
pzc=bwareaopen(pz,maxarea-200);
%%
% nf1=temp.*cx{1,i};
% nf2=sum(sum(nf1));
% nf(j)=nf2/(sum(sum(temp)));
% mx=max(nf(j));
%%
stat2=regionprops(pzc,'Area','BoundingBox','Image','Orientation','Centroid');
cx=cell(1,8);
for i=1:8
x=stat2(i).Image;
rx=imresize(x, [60 30]);
%figure,imshow(rx)

cx{1,i}=rx;
fx=mat2gray(cx{1,1});
%imshow(cx{1,2})
imwrite(rx,['E:\matlabfile\New folder\' num2str(i) '.jpg']);% ADDRESS NEVESHTAN KARAKTER HA
end
%% khandane karakterha  ============  mini database1
ch1=imread('E:\matlabfile\New folder\1.jpg');
ch2=imread('E:\matlabfile\New folder\2.jpg');
ch3=imread('E:\matlabfile\New folder\3.jpg');
ch4=imread('E:\matlabfile\New folder\4.jpg');
ch5=imread('E:\matlabfile\New folder\5.jpg');
ch6=imread('E:\matlabfile\New folder\6.jpg');
ch7=imread('E:\matlabfile\New folder\7.jpg');
ch8=imread('E:\matlabfile\New folder\8.jpg');

t=plak(ch1,ch2,ch3,ch4,ch5,ch6,ch7,ch8);
disp(t);
z=t;
end