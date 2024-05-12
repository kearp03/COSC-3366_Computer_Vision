clear all
clc

I = imread('tire.tif');
J = adapthisteq(I,'clipLimit',0.02,'Distribution','rayleigh');
iHisteq = histeq(I);

imshow(I)
figure
imshowpair(iHisteq, J, 'montage')