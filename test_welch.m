%%
%{
clear all;close all;clc;
imgs = randn(10,64,64); % 10 white noise images
wJ = 4; % window size is 2^wJ, should be smaller than image size
pos = compute_power_spectrum_welch(imgs,wJ);
[Spos,Vpos,Kpos] = mySpectre2D(pos);
plot(Kpos,Spos)
xlabel('freq mode')
ylabel('radial power spectrum')
%}

% imagesc(fftshift(pos),[0,2])
% colorbar 
% colormap gray
%%
clear all;close all;
clc;
ns=load('ns_randn3u_N256.mat');
%ns=load('demo_whitenoise_N64.mat');
%ns=load('demo_fbmB4_N256.mat');
[~,~,num]=size(ns.imgs);
for i=1:num
    imgs(i,:,:)=ns.imgs(:,:,i);
end
%imgs = randn(100,64,64); % 10 white noise images
wJ = 5; % window size is 2^wJ, should be smaller than image size
pos = compute_power_spectrum_welch(imgs,wJ);
%{
subplot(2,2,1);
mesh(fftshift(pos));
title('ns randn3u N256:原始图片功率谱:mesh');
subplot(2,2,2);
mesh(log10(fftshift(pos)));
title('ns randn3u N256:原始图片功率谱:mesh log10');
subplot(2,2,3);
imagesc(fftshift(pos),[0,2]);
colorbar;
colormap gray;
title('ns randn3u N256:原始图片功率谱');
subplot(2,2,4);
imagesc(log10(fftshift(pos)),[0,2]);
colorbar;
colormap gray;
title('ns randn3u N256:原始图片功率谱(log10)');
%}



ns1=load('demo_whitenoise_N64.mat');
%ns1=ns1*(max(max(imgs))-min(min(imgs)))+min(min(imgs));
[~,~,num1]=size(ns1.imgs);
MA=max(max(ns1.imgs));MI=min(min(ns1.imgs));
for i=1:num1
    imgs1(i,:,:)=ns1.imgs(:,:,i);
end
%ns1=im2double(imread('noise_1.jpeg'));
%ns1=rgb2gray(nss1);
%imgs = randn(100,64,64); % 10 white noise images
%imgs1(1,:,:)=ns1;
wJ1 = 6; % window size is 2^wJ, should be smaller than image size
pos1 = compute_power_spectrum_welch(imgs1,wJ1);

%{
subplot(2,2,1);
mesh(fftshift(pos1));
title('demo whitenoise N64:原始图片功率谱:mesh');
subplot(2,2,2);
mesh(log10(fftshift(pos1)));
title('demo whitenoise N64:原始图片功率谱:mesh log10');
subplot(2,2,3);
imagesc(fftshift(pos1),[0,2]);
colorbar;
colormap gray;
title('demo whitenoise N64:原始图片功率谱');
subplot(2,2,4);
imagesc(log10(fftshift(pos1)),[0,2]);
colorbar;
colormap gray;
title('demo whitenoise N64:原始图片功率谱(log10)');
%}


%%
ns2=load('demo_fbmB4_N256.mat');
[~,~,num2]=size(ns2.imgs);
for i=1:num2
    imgs2(i,:,:)=ns2.imgs(:,:,i);
end
%imgs = randn(100,64,64); % 10 white noise images
wJ2 = 6; % window size is 2^wJ, should be smaller than image size
pos2 = compute_power_spectrum_welch(imgs2,wJ2);

%{
subplot(2,2,1);
mesh(fftshift(pos2));
title('demo fbmB4 N256:原始图片功率谱:mesh');
subplot(2,2,2);
mesh(log10(fftshift(pos2)));
title('demo fbmB4 N256:原始图片功率谱:mesh log10');
subplot(2,2,3);
imagesc(fftshift(pos2),[0,2]);
colorbar;
colormap gray;
title('demo fbmB4 N256:原始图片功率谱');
subplot(2,2,4);
imagesc(log10(fftshift(pos2)),[0,2]);
colorbar;
colormap gray;
title('demo fbmB4 N256:原始图片功率谱(log10)');
%}

%%
%clear all;close all;clc;
des_imgs=im2double(imread('ns_des1700.png'));
%figure;
%imshow(des_imgs);
desg_imgs=rgb2gray(des_imgs);
%figure;
%imshow(desg_imgs);
for i=1:12
    for j=1:12
        imgs3(12*(i-1)+j,:,:)=desg_imgs(66*(i-1)+1:66*(i-1)+64,66*(j-1)+1:66*(j-1)+64);
        imgs3(12*(i-1)+j,:,:)=imgs3(12*(i-1)+j,:,:)-mean(mean(imgs3(12*(i-1)+j,:,:)));
    end
end
wJ3 = 5; % window size is 2^wJ, should be smaller than image size
pos3 = compute_power_spectrum_welch(imgs3,wJ3);
%figure;
figure;
[Spos,Vpos,Kpos] = mySpectre2D(pos);
%plot(Kpos,Spos);
plot(Kpos,log10(Spos),'b');
hold on;
title('ns randn3u N256:图片radial功率谱');
[Spos3,Vpos3,Kpos3] = mySpectre2D(pos3);
%plot(Kpos3,Spos3);
plot(Kpos3,log10(Spos3),'r');
hold on;
legend('原始','生成');
%title('ns randn3u N256:生成图片radial功率谱');
%{
subplot(2,2,1);
mesh(fftshift(pos3));
title('ns randn3u N256:生成图片功率谱:mesh');
subplot(2,2,2);
mesh(log10(fftshift(pos3)));
title('ns randn3u N256:生成图片功率谱:mesh log10');
subplot(2,2,3);
imagesc(fftshift(pos3),[0,2]);
colorbar;
colormap gray;
title('ns randn3u N256:生成图片功率谱');
subplot(2,2,4);
imagesc(log10(fftshift(pos3)),[0,2]);
colorbar;
colormap gray;
title('ns randn3u N256:生成图片功率谱(log10)');
%}

%%
%clear all;close all;clc;
des_imgs1=im2double(imread('des_500.png'));
%des_imgs1=imread('demo64_des290.png');
%figure;
%imshow(des_imgs);
desg_imgs1=rgb2gray(des_imgs1);
%figure;
%imshow(desg_imgs);
for i=1:12
    for j=1:12
        imgs4(12*(i-1)+j,:,:)=im2double(des_imgs1(66*(i-1)+1:66*(i-1)+64,66*(j-1)+1:66*(j-1)+64));
        %imgs4(12*(i-1)+j,:,:)=imgs4(12*(i-1)+j,:,:)-mean(mean(imgs4(12*(i-1)+j,:,:)));
        imgs4(12*(i-1)+j,:,:)=imgs4(12*(i-1)+j,:,:)*(MA-MI)+MI;
    end
end
wJ4 = 6; % window size is 2^wJ, should be smaller than image size
pos4 = compute_power_spectrum_welch(imgs4,wJ4);
%figure;
figure;
[Spos1,Vpos1,Kpos1] = mySpectre2D(pos1);
%plot(Kpos1,Spos1);
plot(Kpos1,log10(Spos1),'b');
hold on;
title('demo whitenoise N64:图片radial功率谱');
[Spos4,Vpos4,Kpos4] = mySpectre2D(pos4);
%plot(Kpos4,Spos4);
plot(Kpos4,log10(Spos4),'r');
hold on;
legend('原始','生成');
%title('demo whitenoise N64:生成图片radial功率谱');
%{
subplot(2,2,1);
mesh(fftshift(pos4));
title('demo whitenoise N64:生成图片功率谱:mesh');
subplot(2,2,2);
mesh(log10(fftshift(pos4)));
title('demo whitenoise N64:生成图片功率谱:mesh log10');
subplot(2,2,3);
imagesc(fftshift(pos4),[0,2]);
colorbar;
colormap gray;
title('demo whitenoise N64:生成图片功率谱');
subplot(2,2,4);
imagesc(log10(fftshift(pos4)),[0,2]);
colorbar;
colormap gray;
title('demo whitenoise N64:生成图片功率谱(log10)');
%}


%%
%clear all;close all;clc;
des_imgs2=im2double(imread('des_1501.png'));
%figure;
%imshow(des_imgs);
desg_imgs2=rgb2gray(des_imgs2);
%figure;
%imshow(desg_imgs);
for i=1:12
    for j=1:12
        imgs5(12*(i-1)+j,:,:)=desg_imgs2(66*(i-1)+1:66*(i-1)+64,66*(j-1)+1:66*(j-1)+64);
        %imgs5(12*(i-1)+j,:,:)=imgs5(12*(i-1)+j,:,:)-mean(mean(imgs5(12*(i-1)+j,:,:)));
        imgs5(12*(i-1)+j,:,:)=imgs5(12*(i-1)+j,:,:)-0.5;
    end
end
wJ5 = 6; % window size is 2^wJ, should be smaller than image size
pos5 = compute_power_spectrum_welch(imgs5,wJ5);
%figure;
figure;
[Spos2,Vpos2,Kpos2] = mySpectre2D(pos2);
%plot(Kpos2,Spos2);
plot(Kpos2,log10(Spos2),'b');
hold on;
title('demo fbmB4 N256:图片radial功率谱');
[Spos5,Vpos5,Kpos5] = mySpectre2D(pos5);
%plot(Kpos5,Spos5);
plot(Kpos5,log10(Spos5),'r');
hold on;
legend('原始','生成');
%title('demo fbmB4 N256:生成图片radial功率谱');
%{
subplot(2,2,1);
mesh(fftshift(pos5));
title('demo fbmB4 N256:生成图片功率谱:mesh');
subplot(2,2,2);
mesh(log10(fftshift(pos5)));
title('demo fbmB4 N256:生成图片功率谱:mesh log10');
subplot(2,2,3);
imagesc(fftshift(pos5),[0,2]);
colorbar;
colormap gray;
title('demo fbmB4 N256:生成图片功率谱');
subplot(2,2,4);
imagesc(log10(fftshift(pos5)),[0,2]);
colorbar;
colormap gray;
title('demo fbmB4 N256:生成图片功率谱(log10)');
%}

%{
figure;
ii(:,:)=imgs(50,:,:);
imshow(ii);

figure;
ii1(:,:)=imgs1(1,:,:);
imshow(ii1);

figure;
ii2(:,:)=imgs(50,:,:);
imshow(ii2);

f=figure;
colnames={'ns','demo whitenoise','demo fbmB4'};
t=uitable(f,'Data',[norm(pos-pos3),norm(pos1-pos4),norm(pos2-pos5)],'ColumnName',colnames,'position',[100 100 300 200]);


norm(fftshift(pos)-fftshift(pos3))
norm(fftshift(pos1)-fftshift(pos4))
norm(fftshift(pos2)-fftshift(pos5))
%}