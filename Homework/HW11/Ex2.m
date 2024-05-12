clear all
clc

I1 = imread('L_stereoImg.jpg');
I2 = imread('R_stereoImg.jpg');
figure
imshowpair(I1, I2, 'montage'); 
title('Original Images');

data = load('stereoParams.mat');
stereoParams = data.stereoParams;
E = stereoParams.EssentialMatrix;

[J1,J2] = rectifyStereoImages(I1,I2,stereoParams);

figure
imshowpair(J1, J2, 'montage'); 
title('Rectified Images');

figure
imshow(J1);
title('Select ROI');
rect = getrect; %rect = [xmin ymin width height]

ROI = J2(uint64(rect(2)):uint64(rect(2)+rect(4)), 1:size(J1, 2), :);
figure
imshow(ROI);
title('ROI to search')
hold on

cap = J1(uint64(rect(2)):uint64(rect(2)+rect(4)), uint64(rect(1)):uint64(rect(1)+rect(3)), :);

c = normxcorr2(rgb2gray(cap), rgb2gray(ROI));
% figure
% surf(c);
% shading flat

[ypeak,xpeak] = find(c==max(c(:)));
xpeak = xpeak-rect(3)/2;
ypeak = ypeak-rect(4)/2;

plot(xpeak, ypeak, 'go');

ypeak = ypeak+rect(2);
figure
imshow(J2)
hold on
plot(xpeak, ypeak, 'go');

point1 = [size(cap,2)/2/size(J1,2); (rect(2)+rect(4)/2)/size(J1,1); 1];
point2 = [xpeak/size(J2,2); ypeak/size(J2,1); 1];

error = point2'*E*point1;
disp(['x2T*E*x1 = ', num2str(error)])

d = abs(point1(1)*size(J1,2) - point2(1)*size(J2,2));
f = mean(stereoParams.CameraParameters1.Intrinsics.FocalLength);
b = abs(stereoParams.PoseCamera2.Translation(1));

depth = f*b/d;

disp(['Depth = ', num2str(depth/1000), ' m'])