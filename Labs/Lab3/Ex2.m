clear all
clc

I = imread('coins.png');
trueVal = graythresh(I)*255;
count = 0;
meanVal = round(mean(I(:)));
diff = 100;

while true
    upperMean = 0;
    upperCount = 0;
    lowerMean = 0;
    lowerCount = 0;
    for r=1:size(I, 1)
        for c=1:size(I, 2)
            pixel = I(r,c);
            if(pixel <= meanVal)
                lowerMean = double(lowerMean) + double(pixel);
                lowerCount = lowerCount + 1;
            else
                upperMean = double(upperMean) + double(pixel);
                upperCount = upperCount + 1;
            end
        end
    end
    lowerMean = double(lowerMean) / lowerCount;
    upperMean = double(upperMean) / upperCount;
    newMean = round((lowerMean + upperMean) / 2);
    diff = abs(newMean - meanVal);
    meanVal = newMean;
    count = count + 1;
    if(diff < 1)
        break
    end
end

IBW = logical(I(:,:));

for r=1:size(IBW,1)
    for c=1:size(IBW,2)
        if(I(r,c) < meanVal)
            IBW(r,c) = 0;
        else
            IBW(r,c) = 1;
        end
    end
end

imshow(IBW)