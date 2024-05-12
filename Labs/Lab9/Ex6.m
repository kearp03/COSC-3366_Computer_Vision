clear all
clc

resolution = [1920 1080];
pixel = 1e-5;
f = 45e-3;

K = [1/pixel, 0,      resolution(1)/2;
     0,      1/pixel, resolution(2)/2;
     0,      0,      1];
I = [f, 0, 0, 0;
     0, f, 0, 0;
     0, 0, 1, 0];
P = [0.2 1.0 250.0, 1]';

pts = K*I*P;

u = pts(1)/pts(3);
v = pts(2)/pts(3);

disp(['[', num2str(u), ', ', num2str(v), ']'])