clear all
clc

logo = imread('TSUlogo.jpg');
imshow(logo)

[x, y] = getpts;

P = [x(1), y(1); x(2), y(2); x(3), y(3); x(4), y(4)]'

books = imread('book.jpg');
figure
imshow(books)

[x, y] = getpts;

Q = [x(1), y(1); x(2), y(2); x(3), y(3); x(4), y(4)]'

H = homography(P, Q)

figure
warpedLogo = homwarp(H, logo, 'full');
imshow(warpedLogo)

left = uint64(min(x));
right = uint64(max(x));
bottom = uint64(min(y));
top = uint64(max(y));

for r=bottom:top
    for c=left:right
        if(~isnan(warpedLogo(r-bottom+1, c-left+1, :)))
            books(r, c, :) = 255*warpedLogo(r-bottom+1, c-left+1, :);
        end
    end
end

figure
imshow(books)