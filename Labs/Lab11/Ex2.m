clear all
clc

IL = imread('L_stereoImg.jpg');
IR = imread('R_stereoImg.jpg');

sensorWidth = 4.8; %in mm
fmm = 3.67; %in mm
imageWidth = size(IL, 2); %in px
fpx = imageWidth * fmm / sensorWidth;
baseline = 20; %in cm

%Select the cap on the left image
figure; imshow(IL);
[x1, y1] = getpts();

%Select the cap on the right image
figure; imshow(IR);
[x2, y2] = getpts();

%Calculate disparity
d = abs(double(x2) - double(x1));

z = fpx*baseline/d;

disp(['The cap is ', num2str(z), ' cm away'])