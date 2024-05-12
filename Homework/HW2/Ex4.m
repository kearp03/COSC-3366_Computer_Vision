clear all
clc

I = imread('coins.png');

for r = 1:size(I, 1)
    for c = 1:size(I, 2)
        I(r,c) = 255 - I(r,c);
    end
end

imshow(I)