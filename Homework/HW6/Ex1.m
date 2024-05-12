clear all
clc

I = imrotate(imread('receipt.jpg'), -90);

IBW = bwareaopen(imbinarize(rgb2gray(I)), 100);

% Gathers the index of each nonzero pixel in the image grouped by 
% row indices and column indices
[rows, cols] = find(IBW);

% Find the four corners of the rectangle
[top, bottom] = bounds(rows);
[left, right] = bounds(cols);

% Calculates the width and height
width = abs(right - left);
height = abs(bottom - top);

figure
imshow(I)
title('Ouput Image')
hold on
rectangle('Position', [left, top, width, height], 'EdgeColor', 'y', 'LineWidth', 3);