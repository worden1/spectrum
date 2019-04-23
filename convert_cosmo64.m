clear all;close all;clc;
load cosmodata0_c5_N256
for i = 1:2
    im = imgs(1:64,1:64,i);
    imgs1(1,:,:)=im;
    wJ1 = 5; % window size is 2^wJ, should be smaller than image size
    pos1 = compute_power_spectrum_welch(imgs1,wJ1);
    figure;
    [Spos1,Vpos1,Kpos1] = mySpectre2D(pos1);
    %plot(Kpos1,Spos1);
    plot(Kpos1,log10(Spos1),'b');
    hold on 
    title('cosmodata0_c5_N256:原始图片radial功率谱');
    
    
    %imgs_o = (imgs-min(min(imgs)))/(max(max(imgs))-min(min(imgs)));
    im = (im-min(imgs(:)))/(max(imgs(:))-min(imgs(:)));
    imwrite(im,sprintf('./cosmodata/cosmodata_%d.png',i),'png');
    ns1=im2double(imread(sprintf('./cosmodata/cosmodata_%d.png',i)));
    %ns1=ns1-0.5;
    %ns1=ns1*(max(max(imgs))-min(min(imgs)))+min(min(imgs));
    ns1=ns1*(max(imgs(:))-min(imgs(:)))+min(imgs(:));
    %ns1=ns1*(max(max(imgs))-min(min(imgs)))+min(min(imgs));
    %ns1=im2double(imread('noise_n.png'));
    %ns1=rgb2gray(nss1);
    %imgs = randn(100,64,64); % 10 white noise images
    imgs2(1,:,:)=ns1;
    wJ2 = 5; % window size is 2^wJ, should be smaller than image size
    pos2 = compute_power_spectrum_welch(imgs2,wJ2);
    %figure;
    [Spos2,Vpos2,Kpos2] = mySpectre2D(pos2);
    %plot(Kpos2,Spos2);
    plot(Kpos2,log10(Spos2),'r');
    hold on
    %title('demo fbmB4 N64:生成图片radial功率谱');
    legend('原始','生成');
end