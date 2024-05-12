clear all
clc

I = imread('coins.png');

Inoise = imnoise(I, 'salt & pepper', 0.1);
imshowpair(I, Inoise, 'montage')

Inoiseless = medfilt2(Inoise, [19 19]);
figure
imshowpair(Inoise, Inoiseless, 'montage')
