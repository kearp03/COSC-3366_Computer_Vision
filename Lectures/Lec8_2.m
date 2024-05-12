clear all
clc

I = imread('coins.png');

Ibw = imbinarize(I);
imshow(Ibw)
coinsFilled = imfill(Ibw,'holes');
figure
imshow(coinsFilled)

[Labels, NumberOfCoins] = bwlabel(double(coinsFilled));

coinProperties = regionprops(Labels, 'Area', 'Centroid');