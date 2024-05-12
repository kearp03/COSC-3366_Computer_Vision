clear all
clc

f = 3.67e-3;

pixel = 6e-6;

resolution = [640 480];

theta = 10;

E = [1, 0,           0,            0.1;
     0, cosd(theta), -sind(theta), 0.3;
     0, sind(theta), cosd(theta),  2];

W = [0.2, -0.4, 4.3, 1]';

K = [1/pixel, 0,      resolution(1)/2;
     0,      1/pixel, resolution(2)/2;
     0,      0,      1];
I = [f, 0, 0;
     0, f, 0;
     0, 0, 1];

pts = K*I*E*W;

u = pts(1)/pts(3);
v = pts(2)/pts(3);

disp(['[', num2str(u), ', ', num2str(v), ']'])