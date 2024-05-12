clear all
clc

A = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];
B = [50 51 52 53; 54 55 56 57; 58 59 60 61; 62 63 64 65];
C = [100 101 102 103; 104 105 106 107; 108 109 110 111; 112 113 114 115];

ThreeDArray(:, :, 1) = A;
ThreeDArray(:, :, 2) = B;
ThreeDArray(:, :, 3) = C;

exists = false;
for r = 1:size(ThreeDArray, 1)
    for c = 1:size(ThreeDArray, 2)
        for p = 1:size(ThreeDArray, 3)
            if ThreeDArray(r, c, p) == 103
                exists = true;
            end
        end
    end
end

if exists
    disp('103 exists in the 3D array')
else
    disp('103 does not exist in the 3D array')
end