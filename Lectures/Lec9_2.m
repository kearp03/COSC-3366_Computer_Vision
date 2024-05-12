clear all
clc

I = imread('printedtext.png');

GBW = imbinarize(I);

ABW = imbinarize(I, 'adaptive', 'ForegroundPolarity', 'dark', 'Sensitivity', 0.2);

imshowpair(GBW, ABW, 'montage')