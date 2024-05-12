I = imread('coins.png');

B = imbinarize(I); %convert to binary

BW2 = imfill(B, 'holes'); %fill holes

[B,L,n,A] = bwboundaries(BW2); %use imtool(L) to view labels

imshow(BW2); %plot coins B+W image

hold on; %hold B+W image

%plot boundaries with blue color on top of the B+W image

for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'b', 'LineWidth', 2)
end
