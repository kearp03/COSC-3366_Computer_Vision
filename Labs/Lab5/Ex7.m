clear all
clc

patch = rgb2gray(imread('carPatch.png'));

numCars = 10;
cars = cell(1, numCars);

files = dir('cars/*.jpg');

for i=1:numCars
    cars{i}.im = imread(['cars/', files(i).name]);
    if(size(patch, 1) > size(cars{i}.im, 1) || size(patch, 2) > size(cars{i}.im, 2))
        cars{i}.im = imresize(cars{i}.im, [size(patch, 1), size(patch, 2)]);
    end
    cars{i}.corr = normxcorr2(patch, rgb2gray(cars{i}.im));
    cars{i}.maxC = max(cars{i}.corr(:));
    [cars{i}.maxCoordy, cars{i}.maxCoordx] = find(cars{i}.corr==max(cars{i}.corr(:)));
end

maxCar = 1;
for i=2:numCars
    if(cars{i}.maxC > cars{maxCar}.maxC)
        maxCar = i;
    end
end

yoffSet = cars{maxCar}.maxCoordy - size(patch, 1);
xoffSet = cars{maxCar}.maxCoordx - size(patch, 2);

figure
imshow(cars{maxCar}.im)
title(files(maxCar).name)

drawrectangle(gca, 'Position',[xoffSet, yoffSet, size(patch,2), size(patch,1)], 'FaceAlpha',0);