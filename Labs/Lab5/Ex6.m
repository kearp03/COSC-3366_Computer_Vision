clear all
clc

imgOR = bitwiseOR('imgCats.png', 'imgCats_kernelNOT.png');

imshow(imgOR)