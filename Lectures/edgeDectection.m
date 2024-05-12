clear all
clc

I = imread('circuit.tif');
BW1 = edge(I, 'canny');
BW2 = edge(I, 'prewitt');
BW3 = edge(I, 'sobel');
BW4 = edge(I, 'roberts');
BW5 = edge(I, 'canny', 0.5);

imshowpair(BW1, BW2, 'montage')
figure
imshowpair(BW3, BW4, 'montage')
figure
imshow(BW5)