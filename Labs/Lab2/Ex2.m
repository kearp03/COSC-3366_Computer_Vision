clear all
clc

A = zeros(3);
B = [1, 2, 3; 4, 5, 6; 7, 8, 9];

for r = 1:size(B, 1)
    for c = 1:size(B, 2)
        A(r, c) = B(r, c);
    end
end

disp('Matrix A:')
disp(A)

disp('Matrix B:')
disp(B)