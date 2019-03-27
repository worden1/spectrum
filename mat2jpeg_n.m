%%
clear all;close all;
clc;
ns=load('ns_randn3u_N256.mat');
figure;
mesh(ns.imgs(:,:,1));
abs(ns.imgs(:,:,1)-ns.imgs(:,:,2))
[~,~,h]=size(ns.imgs);
%%
for i=1:h
    imgname=strcat(strcat('ns_',num2str(i)),'.jpeg');
    imwrite(ns.imgs(:,:,i),imgname,'jpeg');
end
%%
im=imread('ns_1.jpeg');
double(im)-ns.imgs(:,:,1)
%%
demo_64=load('demo_whitenoise_N64.mat');
demo_256=load('demo_fbmB4_N256.mat');
figure;
mesh(demo_64.imgs);
imwrite(demo_64.imgs,'demo_64.jpeg','jpeg');
figure;
mesh(demo_256.imgs(:,:,1));
[~,~,hh]=size(demo_256.imgs);
for j=1:hh
    imgname=strcat(strcat('demo_256_',num2str(j)),'.jpeg');
    imwrite(demo_256.imgs(:,:,j),imgname,'jpeg');
end