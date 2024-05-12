clear all
clc
I = imread('cars.jpg');
BlueCar = I(388:790, 81:820, :);

imwrite(BlueCar, 'BlueCar.jpg');

imshow(BlueCar)