clear all
clc

I = imread('singleViewMetrology_inputImage.jpg');
Itrue = imread('singleViewMetrology_groundTruth.jpg');

figure; imshow(I)
%Get top and bottom coordinates of the door
[x, y] = getpts();

%Get points from lines to find vanishing point
[xs, ys] = getpts();
m1 = (ys(2) - ys(1))/(xs(2) - xs(1));
m2 = (ys(4) - ys(3))/(xs(4) - xs(3));
m3 = (ys(6) - ys(5))/(xs(6) - xs(5));
m4 = (ys(8) - ys(7))/(xs(8) - xs(7));

A = [-m1, 1;
     -m2, 1;
     -m3, 1;
     -m4, 1];
B = [ys(1) - m1*xs(1); ys(3) - m2*xs(3); ys(5) - m3*xs(5); ys(7) - m4*xs(7)];
%Approximates the solution to the system of equations
B = A'*B;
A = A'*A;
A(:, end+1) = B(:);
R = rref(A);

Hcm = 1.33; %Height of camera in meters

Hcp = y(2)- R(2, 3); %Height of camera in pixels

Hop = abs(double(y(2)) - double(y(1))); %Height of object in pixels

f = 3.67; %Focal length in mm

Himgp = size(I, 1); %height of image in pixels

Hsmm = 2.72; %Height of sensors in mm

Hom = Hcm * Hop / Hcp; %Height of object in meters
d = f*Hom*Himgp/Hop/Hsmm;

disp(['Height of door: ', num2str(Hom), ' m'])
disp(['Distance to door: ', num2str(d), ' m'])