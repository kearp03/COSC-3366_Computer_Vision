clear all
clc

flag = imread('Texas_flag.jpg');
imshow(flag)

[x, y] = getpts;

P = [x(1), y(1); x(2), y(2); x(3), y(3); x(4), y(4)]'

pool = imread('pool.png');
figure
imshow(pool)

[x, y] = getpts;

Q = [x(1), y(1); x(2), y(2); x(3), y(3); x(4), y(4)]'

H = homography(P, Q)

figure
warpedFlag = homwarp(H, flag, 'full');
imshow(warpedFlag)

left = uint64(min(x));
right = uint64(max(x));
bottom = uint64(min(y));
top = uint64(max(y));

for r=1:size(warpedFlag,1)
    for c=1:size(warpedFlag,2)
        if(~isnan(warpedFlag(r, c, :)))
            pool(r+left-1, c+bottom-1, :) = 255*warpedFlag(r, c, :);
        end
    end
end

figure
imshow(pool)