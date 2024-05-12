clear all
clc

I = imread('coins.png');
Inoise = imnoise(I, 'salt & pepper', 0.08);
medFiltI = Inoise;

neighborhoodSize = input('Enter the size of the neighborhood: ');
buffer = round((neighborhoodSize)/2);

for r=buffer:size(medFiltI,1)-buffer+1
    for c=buffer:size(medFiltI,2)-buffer
        neighborhood = Inoise(r-buffer+1:r+buffer-1, c-buffer+1:c+buffer-1);
        medFiltI(r,c) = median(neighborhood(:));
    end
end

imshowpair(Inoise, medFiltI, 'montage')