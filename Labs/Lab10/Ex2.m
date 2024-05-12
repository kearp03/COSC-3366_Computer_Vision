clear all;
clc

%image 1
I1 = imread('view1.png'); %convert to gray scale image if it is a color image
I1gray = rgb2gray(I1);
points1 = detectBRISKFeatures(I1gray); %detect SURF features
imshow(I1gray); 
hold on;
plot(points1.selectStrongest(180)); %plot the 180 strongest points; plot(points) %plots all points
[feature1, validPoints1] = extractFeatures(I1gray, points1.selectStrongest(180)); %extract descriptors

%image 2
I2 = imread('view2.png'); %same process is repeated for image 2
I2gray = rgb2gray(I2);
points2 = detectBRISKFeatures(I2gray);
figure;
imshow(I2gray); 
hold on;
plot(points2.selectStrongest(180));
[feature2, validPoints2] = extractFeatures(I2gray, points2.selectStrongest(180));

indexPairs=matchFeatures(feature1,feature2); %get index of matched features between image 1 and image 2

matchedPoints1 = validPoints1(indexPairs(:,1),:); %get orientation, location, etc. of matched features for image 1
matchedPoints2 = validPoints2(indexPairs(:,2),:); %get orientation, location, etc. of matched features for image 2

figure;
showMatchedFeatures(I1, I2, matchedPoints1,matchedPoints2, 'montage'); %display matched features between image 1 and image 2

H = homography(matchedPoints2.Location', matchedPoints1.Location');
warpedI2 = homwarp(H, I2, 'full');
figure; imshow(warpedI2)
warpedI2gray = rgb2gray(warpedI2);
warpedPoints2 = detectBRISKFeatures(warpedI2gray);
figure; imshow(warpedI2gray)
hold on; plot(warpedPoints2.selectStrongest(180));
[warpedFeature2, warpedValidPoints2] = extractFeatures(warpedI2gray, warpedPoints2.selectStrongest(180));

indexPairs = matchFeatures(feature1, warpedFeature2);

matchedPoints1 = validPoints1(indexPairs(:,1),:); %get orientation, location, etc. of matched features for image 1
matchedPoints2 = warpedValidPoints2(indexPairs(:,2),:); %get orientation, location, etc. of matched features for image 2

figure;
showMatchedFeatures(I1, warpedI2, matchedPoints1,matchedPoints2, 'montage'); %display matched features between image 1 and image 2

[rightmost1, indx] = max(matchedPoints1.Location(:,1));
rightmost1 = uint64(rightmost1);
row1 = uint64(matchedPoints1.Location(indx,2));
leftmost2 = uint64(matchedPoints2.Location(indx, 1));
row2 = uint64(matchedPoints2.Location(indx, 2));
rowdiff = abs(double(row1) - double(row2));
I1 = padarray(I1, double(rowdiff), 'pre');
I1 = padarray(I1, double(abs(size(I1 ,1)-size(warpedI2, 1))), 'post');
I1(:, rightmost1:(rightmost1+(size(warpedI2, 2) - leftmost2)), :) = uint8(warpedI2(:, leftmost2:end, :)*255);
figure; imshow(I1)