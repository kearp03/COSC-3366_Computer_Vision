clear all;
clc;

I=imread('notre-dame.jpg');
imshow(I);

% Input pairs of points consecutively, that is: select the first P point,
% then it's corresponding Q point
[x, y] = getpts;

% P=[560, 242; 80, 236; 51, 359; 600, 348]'
P = [x(1), y(1); x(3), y(3); x(5), y(5); x(7), y(7)]'
% Q=[600, 242; 51, 236; 51, 359; 600, 348]'
Q = [x(2), y(2); x(4), y(4); x(6), y(6); x(8), y(8)]'

%plot markers + and o
hold on; %plot markers on image displayed
plot(P(1, :), P(2, :), 'y+', 'MarkerSize', 16, 'LineWidth', 4); %y: yellow; +: cross
plot(Q(1, :), Q(2, :), 'ro', 'MarkerSize', 16, 'LineWidth', 4); %r: red; o: circle

H = homography(P, Q) %Homography matrix
ImgH = homwarp(H, I, 'full');
figure
homwarp(H, I, 'full'); %show transformed image
figure;
imshow(ImgH); %show transformed image