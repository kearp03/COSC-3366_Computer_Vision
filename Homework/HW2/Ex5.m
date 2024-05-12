clear all
clc

I = imread('cars.jpg');
figure
imshow(I)

[x1, y1] = getpts;

[x2, y2] = getpts;

Icrop = I(uint64(y1):uint64(y2), uint64(x1):uint64(x2), :);

imwrite(Icrop, 'Cropped Cars.jpg')
imshow(Icrop)