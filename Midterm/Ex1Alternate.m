clear all
clc

I = imread('coins.png');
A = double(I);
vars = zeros(256, 1);
totalPixels = size(I,1)*size(I,2);

for i=0:255
    mb = mean(A(A <= i));
    Wb = length(A(A <= i))/totalPixels;
    mf = mean(A(~(A <= i)));
    Wf = length(A(~(A <= i)))/totalPixels;
    vars(i+1) = Wb*Wf*((mb - mf)^2);
end

[~, maxIndex] = max(vars);