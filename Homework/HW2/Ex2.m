clear all
clc

I = imread('cars.jpg');
Igray = I(:,:,1);

for r = 1:size(Igray,1)
    for c = 1:size(Igray,2)
        sum = 0;
        for p = 1:size(I,3)
            sum = double(sum) + double(I(r,c,p));
        end
        Igray(r,c) = (sum)/3;
    end
end

imwrite(Igray, 'carsGrayAverage.jpg')

imshow(Igray)