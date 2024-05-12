clear all
clc

A = [1 2 3; 4 5 6; 7 8 9];
B = [10 20 30; 40 50 60; 70 80 90];

ThreeDArray(:,:,1) = A;
ThreeDArray(:,:,2) = B;

%Goes through each 2D array fully before moving to next 2D array
for z = 1:size(ThreeDArray, 3)
    for r = 1:size(ThreeDArray, 1)
        for c = 1:size(ThreeDArray, 2)
            disp(['Value: ', num2str(ThreeDArray(r,c,z))])
        end
    end
end