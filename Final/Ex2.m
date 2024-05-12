clear all
clc

I = imread("finalExamPic.jpg");

figure;
imshow(I);
%Start in top left, go counterclockwise
[xs, ys] = getpts;
P = [xs(1), ys(1); xs(2), ys(2); xs(3), ys(3); xs(4), ys(4)]';

width = sqrt((xs(1)-xs(4))^2 + (ys(1)-ys(4))^2);
height = sqrt((xs(1)-xs(2))^2 + (ys(1)-ys(2))^2);
widthheightRatio1 = width/height;

%Just top left point
[x, y] = getpts;
Q = [x, y; x, y+height; x+width, y+height; x+width, y]';

H = homography(P, Q);
ImgH = homwarp(H, I, 'full');
figure
imshow(ImgH);
%Start in top left, go counterclockwise
[xs, ys] = getpts();

width = sqrt((xs(1)-xs(4))^2 + (ys(1)-ys(4))^2);
height = sqrt((xs(1)-xs(2))^2 + (ys(1)-ys(2))^2);
widthheightRatio2 = width/height;

err = abs(widthheightRatio1 - widthheightRatio2);

disp(['Error in ratio: ', num2str(err)])