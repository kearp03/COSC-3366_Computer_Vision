clear all;
clc

%image 1
I = imread('cameraman.tif'); %convert to gray scale image if it is a color image
points = detectSURFFeatures(I); %detect SURF features
imshow(I); 
hold on;
plot(points.selectStrongest(20)); %plot the 20 strongest points; plot(points) %plots all points
[feature, validPoints] = extractFeatures(I, points.selectStrongest(20)); %extract descriptors

%image 2
Ir=imrotate(I, 45); %same process is repeated for image 2
pointsR = detectSURFFeatures(Ir);
figure;
imshow(Ir); 
hold on;
plot(pointsR.selectStrongest(20));
[featureR, validPointsR] = extractFeatures(Ir, pointsR.selectStrongest(20));

indexPairs=matchFeatures(feature,featureR); %get index of matched features between image 1 and image 2

matchedPoints1 = validPoints(indexPairs(:,1),:); %get orientation, location, etc. of matched features for image 1
matchedPoints2 = validPointsR(indexPairs(:,2),:); %get orientation, location, etc. of matched features for image 2

figure;
showMatchedFeatures(I, Ir, matchedPoints1,matchedPoints2, 'montage'); %display matched features between image 1 and image 2
