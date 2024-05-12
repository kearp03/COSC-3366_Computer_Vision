clear all
clc

I = imread('cars.jpg');
Igray = I(:,:,1);

for r = 1:size(Igray,1)
    for c = 1:size(Igray,2)
        Igray(r,c) = 0.299*double(I(r,c,1)) + 0.587*double(I(r,c,2)) + 0.114*double(I(r,c,3));
    end
end

imwrite(Igray, 'carsGrayLum.jpg')
matIgray = rgb2gray(I);

imshowpair(Igray, matIgray, 'montage')