clear all
clc

patch = imresize(rgb2gray(imread('carPatch.png')), 0.25);
cars = imresize(rgb2gray(imread('cars.jpg')), 0.25);

SAD = zeros(size(cars,1)-size(patch,1)+1, size(cars,2)-size(patch,2)+1);

for r=1:size(SAD, 1)
    for c=1:size(SAD, 2)
        region = cars(r:(r+size(patch,1)-1), c:(c+size(patch,2)-1));
        SAD(r,c) = sum(abs(double(region(:) - patch(:))));
    end
end

[miny, minx] = find(SAD==min(SAD(:)));

imshow(cars)
drawrectangle(gca,'Position',[minx,miny,size(patch,2),size(patch,1)], 'FaceAlpha',0);