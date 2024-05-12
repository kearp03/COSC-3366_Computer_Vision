function I = imgDivision(file, constant)
    I = double(imread(file))/255;
    I = I/constant;
    I = uint8(I*255);
end