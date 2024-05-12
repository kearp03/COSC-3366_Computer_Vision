clear all 
clc

I = imread('cars.jpg');
G = I(:,:,2);
B = I(:,:,3);

imwrite(G, 'G.jpg');
imwrite(B, 'B.jpg');

imshowpair(G, B, 'montage')