clear all
clc

I = imread('tools.jpg');
Igray = rgb2gray(I);
IBW = imbinarize(Igray);
figure
imshow(I)
figure
imshow(Igray)
figure
imshow(IBW)

figure
imhist(Igray)
threshold = graythresh(Igray) * 255;
line([threshold, threshold], ylim, 'LineWidth', 2, 'Color', 'r')

ylabel('Frequency');
title(['Histogram; Threshold: ', num2str(threshold)])