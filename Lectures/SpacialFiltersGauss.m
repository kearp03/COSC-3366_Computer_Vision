clear all
clc

sigma = 3.0;
I = imread('cars.jpg');
I2 = imgaussfilt(I, sigma);
imshowpair(I, I2, 'montage')

%%
I = imread('cars.jpg');
std1 = 3.0;
std2 = 7.0;
kernel1 = fspecial('gaussian', 6*ceil(3.0)+1, std1);
kernel2 = fspecial('gaussian', 6*ceil(7.0)+1, std2);

blurred1 = imfilter(I, kernel1);
blurred2 = imfilter(I, kernel2);
imshowpair(blurred1, blurred2, 'montage')