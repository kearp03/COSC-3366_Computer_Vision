function I = imgSubtraction(file1, file2)
    I1 = imread(file1);
    I2 = imread(file2);
    I = uint8(zeros(size(I1, 1), size(I1, 2), size(I2, 3)));
    for l=1:size(I, 3)
        for r=1:size(I, 1)
            for c=1:size(I, 2)
                I(r,c,l) = uint8(abs(double(I1(r,c,l) - I2(r,c,l))));
            end
        end
    end
end