clear all
clc

%load in paramters
load('calibrationSession.mat');
stereoParams = calibrationSession.CameraParameters;

%read in images
I1 = imread('L_stereoImg.jpg');
I2 = imread('R_stereoImg.jpg');

%rectify images
[J1, J2] = rectifyStereoImages(I1, I2, stereoParams);
J1rectified = J1;
J2rectified = J2;

%display images after rectification
figure; imshow(J1, 'InitialMagnification',50); title('Rectified Image 1');
figure; imshow(J2, 'InitialMagnification',50); title('Rectified Image 2');

%compute the disparity
disparityMap = disparitySGM(rgb2gray(J1), rgb2gray(J2));

%reconstruct the 3-D world coordinates of points corresponding to each pixel
xyzPoints = reconstructScene(disparityMap, stereoParams);

%segment out objects located 1.2 - 1.5 meters away
Z = xyzPoints(:,:,3);
mask = repmat(Z > 1200 & Z < 1500, [1,1,3]);
J1(~mask) = 0;
figure; imshow(J1, 'InitialMagnification',50); title('Objects 1.2 - 1.5 meters away');


figure; imshow(J1rectified, 'InitialMagnification',50); title('Select Hand Sanitizer');
[x,y] = getpts();
 
depth = mean(xyzPoints(uint64(y):uint64(y)+4,uint64(x):uint64(x)+4,3),'all');
disp(['Depth of sanitizer: ', num2str(depth/1000), ' m'])

A = stereoAnaglyph(J1rectified, J2rectified);
figure; imshow(A); title('Red-Cyan composite view of the rectified stereo pair image');

J1gray = rgb2gray(J1rectified);
J2gray = rgb2gray(J2rectified);

disparityRange = [0 128];
disparityMap = disparitySGM(J1gray, J2gray, 'DisparityRange',disparityRange,'UniquenessThreshold',20);

figure; imshow(disparityMap, DisplayRange=disparityRange); title('Disparity Map');
colormap jet
colorbar