clear all
clc

imgAND = bitwiseAND('imgCats.png', 'imgCats_kernel.png');

imshow(imgAND)