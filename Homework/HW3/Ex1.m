clear all
clc

Itire = imread('tire.tif');

histEqTire = uint8(zeros(size(Itire,1), size(Itire,2)));

Ih = imhist(Itire);

pdf = Ih /(size(Itire,1)*size(Itire,2));
cdf = zeros(size(pdf));

for r=1:size(pdf)
    cdf(r) = sum(pdf(1:r));
end

map = floor(cdf*(length(pdf)-1));

for r=1:size(Itire,1)
    for c=1:size(Itire,2)
        histEqTire(r,c) = map(Itire(r,c)+1);
    end
end

imshowpair(histEqTire, histeq(Itire),'montage');