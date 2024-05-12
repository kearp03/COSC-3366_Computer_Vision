function I = bitwiseOR(file1, file2)
    I1 = imread(file1);
    I2 = imread(file2);
    I = bitor(I1, I2, "uint8");
end