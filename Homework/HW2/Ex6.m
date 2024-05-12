clear all
clc

I = imread('cars.jpg');

IBlue = I;

for r = 1:size(IBlue,1)
    for c = 1:size(IBlue,2)
        IBlue(r,c,1:2) = 0;
    end
end

imshow(IBlue)