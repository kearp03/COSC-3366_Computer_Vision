clear all
clc

Icoins = imread('coins.png');
histeqI = zeros(size(Icoins,1), size(Icoins,2));
Ih = imhist(Icoins);

pdf = Ih/(size(Icoins, 1)*size(Icoins, 2));

cdf = zeros(size(pdf,1),1);
for c=1:size(cdf)
    cdf(c) = sum(pdf(1:c));
end

map = floor(cdf*(256-1));

for r=1:size(Icoins,1)
    for c=1:size(Icoins,2)
        histeqI(r,c) = map(Icoins(r,c)+1);
    end
end

imshow(histeqI)