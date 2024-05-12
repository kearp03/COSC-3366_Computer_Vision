clear all
clc

v = [3, 2, 1, 4, 5];

counter = 0;
sum = 0;
for c = 1:size(v)
    counter = counter + 1;
    sum = sum + v(c);
end
mean = sum/counter;
disp(['Mean: ', num2str(mean)])