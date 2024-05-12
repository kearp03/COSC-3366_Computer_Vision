clear all
clc

Iminput = rgb2gray(imread('histogramMatching_input.jpg'));
Imreference = rgb2gray(imread('histogramMatching_reference.jpg'));

inputHist = imhist(Iminput);
figure
imhist(Iminput)
referHist = imhist(Imreference);
figure
imhist(Imreference)

inputCDF = zeros(size(inputHist));
referCDF = zeros(size(inputHist));

for i=1:length(inputCDF)
    inputCDF(i) = sum(inputHist(1:i));
    referCDF(i) = sum(referHist(1:i));
end


EQ = uint8(zeros(size(Iminput)));

for r=1:size(EQ,1)
    for c=1:size(EQ,2)
        pixel = Iminput(r,c);
        ref = inputCDF(pixel);
        [~, index] = min(abs(referCDF - ref));
        EQ(r,c) = uint8(index)-1;
    end
end

figure
imhist(EQ)
figure
imshowpair(Iminput, Imreference, 'montage')
figure
imshow(EQ)