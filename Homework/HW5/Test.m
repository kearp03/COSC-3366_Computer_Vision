clear all
clc

% Load reference image
refImage = imread('histogramMatching_reference.jpg');

% Convert the reference image to grayscale if it's not already in grayscale
if size(refImage, 3) == 3
    refImageGray = rgb2gray(refImage);
else
    refImageGray = refImage;
end

% Load source image
sourceImage = imread('histogramMatching_input.jpg');

% Convert the source image to grayscale if it's not already in grayscale
if size(sourceImage, 3) == 3
    sourceImageGray = rgb2gray(sourceImage);
else
    sourceImageGray = sourceImage;
end

% Compute histograms
refHist = imhist(refImageGray);
sourceHist = imhist(sourceImageGray);

% Compute cumulative distribution functions (CDFs)
refCDF = cumsum(refHist) / numel(refImageGray);
sourceCDF = cumsum(sourceHist) / numel(sourceImageGray);

% Map the intensity values
matchedImage = zeros(size(sourceImageGray), 'uint8');
for i = 1:size(sourceImageGray, 1)
    for j = 1:size(sourceImageGray, 2)
        intensity = sourceImageGray(i, j);
        matchedIntensity = find(refCDF >= sourceCDF(intensity), 1);
        matchedImage(i, j) = matchedIntensity - 1; % Adjust for 0-based indexing
    end
end

% Display the original source image, reference image, and matched image side by side
figure;
subplot(1, 3, 1);
imshow(sourceImageGray);
title('Source Image');

subplot(1, 3, 2);
imshow(refImageGray);
title('Reference Image');

subplot(1, 3, 3);
imshow(matchedImage);
title('Matched Image');
