clear all
clc

A = [2 4 9; 
     7 0 8; 
     3 5 1];

count = 0;
sum = 0;
for r = 1:size(A, 1)
    for c = 1:size(A, 2)
        count = count + 1;
        sum = sum + A(r, c);
    end
end
mean = sum/count;

disp(['Mean: ', num2str(mean)])