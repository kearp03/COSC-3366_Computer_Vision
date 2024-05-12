clear variables
clear global
clc

I = imread("cameraman.tif");
imshow(I)
title("Original Image")

figure
[L, Centers] = imsegkmeans(I,3);
B = labeloverlay(I,L);
imshow(B)
title("Labeled Image")