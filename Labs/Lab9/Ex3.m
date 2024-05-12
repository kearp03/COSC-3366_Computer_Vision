clear all
clc

f = 45;

M = [f,    0,    0;
     0,    f,    0;
     0,    0,    1];
P = [0.2, 1.0, 250.0]';

pts = M*P;

u = pts(1)/pts(3);
v = pts(2)/pts(3);

disp(['[', num2str(u), ', ', num2str(v), ']'])