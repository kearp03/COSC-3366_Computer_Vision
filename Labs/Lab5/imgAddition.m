function I = imgAddition(file1, file2, weight1)
    weight2 = 1-weight1;
    I1 = imread(file1);
    I2 = imread(file2);
    I = uint8(zeros(size(I1, 1), size(I1, 2), size(I1, 3)));
    for l=1:size(I, 3)
        for r=1:size(I, 1)
            for c=1:size(I, 2)
                I(r,c,l) = uint8(weight1*I1(r,c,l) + weight2*I2(r,c,l));
            end
        end
    end
end