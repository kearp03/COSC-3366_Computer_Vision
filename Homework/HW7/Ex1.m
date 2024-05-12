clear all
clc

I = imread('cameraman.tif');

k = 3;
kMeans = uint8(rand(k,1)*255);
diff = [2, 2, 2];
while(max(diff) > 1)
    clusters = cell(k,1);
    for r=1:size(I,1)
        for c=1:size(I,2)
            [~, index] = min(abs(double(I(r,c))-double(kMeans)));
            clusters{index}(end+1, :) = [r, c];
        end
    end
    
    
    for k=1:size(kMeans)
        values = [];
        for i=1:size(clusters{k},1)
            values(i) = I(clusters{k}(i,1), clusters{k}(i,2));
        end
        diff(k) = abs(double(kMeans(k)) - double(mean(values)));
        kMeans(k) = uint8(mean(values));
    end
end

clusters = cell(k,1);
for r=1:size(I,1)
    for c=1:size(I,2)
        [~, index] = min(abs(double(I(r,c))-double(kMeans)));
        clusters{index}(end+1, :) = [r, c];
    end
end

Labeled = zeros(size(I), 'uint8');

for k=1:size(kMeans)
    for i=1:size(clusters{k},1)
        Labeled(clusters{k}(i,1), clusters{k}(i,2)) = k;
    end
end

[L, centers] = imsegkmeans(I, k);

B = labeloverlay(I, Labeled);
imshowpair(B, labeloverlay(I,L),'montage')