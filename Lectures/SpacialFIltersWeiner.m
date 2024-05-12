clear all
clc

RGB = imread('saturn.png');
I = im2gray(RGB);
J = imnoise(I,"gaussian",0,0.025);
imshowpair(I,J,'montage')
K = weiner2(J,[5 5]);
figure
imshowpair(J,K,'montage')