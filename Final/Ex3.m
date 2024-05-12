clear all
clc

ILeft = imread('viprectification_deskLeft.png');
IRight = imread('viprectification_deskRight.png');

% Load stereo point pairs.

load stereoPointPairs
f = estimateFundamentalMatrix(matchedPoints1, matchedPoints2, 'NumTrials', 2000);
imageSize = size(ILeft,1:2);
    
% Determine whether the image contains epipole and epipole location.     
[isIn,epipole] = isEpipoleInImage(f,imageSize)

figure;
imshow(ILeft);
[xl, yl] = getpts;
hold on;
plot([xl,epipole(1)], [yl,epipole(2)], '-*g')
figure;
imshow(IRight);
[xr, yr] = getpts;
hold on;
plot([xr,epipole(1)], [yr,epipole(2)], '-*g')

err = [xr; yr; 1]'*f*[xl; yl; 1];
disp(['x2^T*F*x1 = ', num2str(err)])
