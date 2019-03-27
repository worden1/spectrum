load texture/ns_randn3u_N256
for k = 1:100
    im = imgs(:,:,k);
    im = (im + 0.5);
    imwrite(im,sprintf('./texture/ns256new/ns_%d.jpeg',k),'jpeg')
end