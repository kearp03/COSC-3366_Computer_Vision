clear all
clc

A = [2 4 9; 
     7 0 8; 
     3 5 1];

for row = 1:size(A, 1)
    for col = 1:size(A, 2)
        if col == 1
            disp(A(row, col))
        end
    end
end