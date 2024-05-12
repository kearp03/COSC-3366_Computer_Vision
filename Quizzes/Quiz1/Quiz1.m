clear all
clc

I = imread('coins.png');

for r=1:size(I,1)
    for c=1:size(I,2)
        if I(r,c) >= 126
            I(r,c) = 255;
        else
            I(r,c) = 0;
        end
    end
end

imshow(I)