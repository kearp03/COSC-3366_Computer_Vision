clear all
clc

I = imread('road.jpg');

Igrey = 0.299*I(:,:,1) + 0.587*I(:,:,2) + 0.114*I(:,:,3);

BW = Igrey(:,:) >= 179;

BW = bwareaopen(BW,250);

figure
imshow(I)
title('Input');

figure
imshowpair(Igrey,BW, 'montage')
title('Output');