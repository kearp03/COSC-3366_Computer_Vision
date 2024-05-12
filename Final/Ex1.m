clear all
clc

I = imread("ComputerVision_txt.jpg");

iminfo = imfinfo("ComputerVision_txt.jpg");

focalLength = iminfo.DigitalCamera.FocalLength; %mm
ImageWidth = iminfo.DigitalCamera.CPixelXDimension; %px
SensorWidth = 8.16; %mm

fpx = focalLength*ImageWidth/SensorWidth;
B = 17; %cm
figure;
imshow(I);
[xs, ys] = getpts;
d = abs(double(xs(1)) - double(xs(2)));

Z = fpx*B/d; %cm

disp(['Depth of textbook is approximatly ', num2str(Z), ' cm'])