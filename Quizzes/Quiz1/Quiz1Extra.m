clear all
clc

v = [3, -2, 9, 4, 8];

max = v(1);

for i = 2:length(v)
    if max < v(i)
        max = v(i);
    end
end

disp(['Max element: ', num2str(max)])