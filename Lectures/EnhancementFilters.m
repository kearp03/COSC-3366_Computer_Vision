clear all
clc

I = imread('cars.jpg');
h = fspecial('prewitt');
I2 = imfilter(I, h);

h = h'; %transpose filter to enphasize vertical edges
I3 = imfilter(I, h);

imshowpair(I2, I3, 'montage');