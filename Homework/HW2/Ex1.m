clear all
clc

I = imread('cars.jpg');
Igray = I(:,:,1);

for r = 1:size(Igray, 1)
    for c = 1:size(Igray, 2)
        Igray(r,c) = (double(mymax(I(r,c,:))) + double(mymin(I(r,c,:))))/2;
    end
end

imwrite(Igray, 'carsGrayLightness.jpg')

imshow(Igray)