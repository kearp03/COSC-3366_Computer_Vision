clear all
clc

I = imread('quartersANDcents.jpg');
IBW = imbinarize(rgb2gray(I));
Ifilled = imfill(IBW, 'holes');
[Labels, numberOfCoins] = bwlabel(double(Ifilled));
coinProperties = regionprops(Labels, 'Area', 'Centroid');

[B, L, n, A] = bwboundaries(Ifilled);

meanArea = 0;
for i=1:numberOfCoins
    meanArea = meanArea + (coinProperties(i).Area/numberOfCoins);
end

for i=1:numberOfCoins
    if(coinProperties(i).Area < meanArea)
        coinProperties(i).type = 'Cent';
    else
        coinProperties(i).type = 'Quarter';
    end
    disp(['Coin ', num2str(i), ': ', coinProperties(i).type])
end

text_str = cell(numberOfCoins, 1);
for i = 1:numberOfCoins
    text_str{i} = coinProperties(i).type;
end

position = zeros(numberOfCoins, 2);
for i=1:numberOfCoins
    position(i, :) = coinProperties(i).Centroid;
end

labeled = insertText(Labels, position, text_str, 'FontSize', 18);

imshow(labeled);
imwrite(Ifilled, 'binaryCoins.jpg');
hold on;
for c=1:length(B)
    boundary = B{c};
    %Plot boundaries around coins
    plot(boundary(:, 2), boundary(:, 1), 'b', 'LineWidth', 2);
    coordXY = coinProperties(c).Centroid;
    %Plot Centroids with a '+'
    plot(coordXY(1), coordXY(2), '+', 'MarkerEdgeColor','red');
end