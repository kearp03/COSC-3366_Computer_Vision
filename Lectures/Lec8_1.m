clear all
clc

I = imread('cars.jpg');
imhist(I(:,:,1));
hold on
imhist(I(:,:,2));
hold on
imhist(I(:,:,3));