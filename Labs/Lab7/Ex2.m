clear all
clc

I = rgb2gray(imread('road_II.jpg'));
BW = edge(I, 'Canny', 0.4);
% imshow(BW)

[H, theta, rho] = hough(BW);

accumulator = zeros(size(H));

for r=1:size(BW,1)
    for c=1:size(BW,2)
        if(BW(r,c))
            for i=1:size(theta)
                rh = r*sind(theta(i)) + c*cosd(theta(i));
                [~, index] = min(abs(rho - rh));
                accumulator(index, i) = accumulator(index, i) + 1;
            end
        end
    end
end

imshowpair(accumulator, H, 'montage')