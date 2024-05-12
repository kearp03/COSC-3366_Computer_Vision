clear all
clc

I = rgb2gray(imread('road_II.jpg'));
BW = edge(I, 'Canny', 0.4);

H = hough(BW);

RhoResolution = 1;
D = sqrt((size(BW,1)-1)^2 + (size(BW,2)-1)^2);
diagonal = RhoResolution*ceil(D/RhoResolution);
rho = -diagonal:diagonal;
theta = -90:89;

Hmine = zeros(length(rho), length(theta));

for r=1:size(BW,1)
    for c=1:size(BW,2)
        if(BW(r,c))
            for th=1:length(theta)
                rh = r*sind(theta(th)) + c*cosd(theta(th));
                [~, index] = min(abs(rho - rh));
                Hmine(index, th) = Hmine(index, th) + 1;
            end
        end
    end
end

imshowpair(Hmine, H, 'montage')