function I = imgMultiplication(file1, file2)
    %Divide entire image by 255
    I1 = double(imread(file1))/255;
    I2 = double(imread(file2))/255;
    I = zeros(size(I1, 1), size(I1, 2), size(I1, 3));
    for l=1:size(I, 3)
        for r=1:size(I, 1)
            for c=1:size(I, 2)
                I(r,c,l) = I1(r,c,l)*I2(r,c,l);
            end
        end
    end
    I = uint8(I*255);
end