clear all
clc

v = [10, -3, 0, 8, 9];

%{
for c = 1:size(v, 2)
    disp(['Value: ', num2str(c)])
end

for c = 1:size(v, 2)
    disp(['Value: ', num2str(v(c))])
end

for c = 3:size(v, 2)
    disp(['Value: ', num2str(v(c))])
end
%}

sum = 0;
for c = 1:size(v, 2)
    sum = sum + v(c);
end
disp(['Sum of v: ', num2str(sum)])

v2 = [1, 4, 5, -8];
sum = 0;
for c = 1:size(v2, 2)
    if v2(c) > 4
        break
    end
    sum = sum + v2(c);
end
disp(['Sum of v2 with break: ', num2str(sum)])

v2 = [1, 4, 5, -8];
sum = 0;
for c = 1:size(v2, 2)
    if v2(c) > 4
        continue
    end
    sum = sum + v2(c);
end
disp(['Sum of v2 with continue: ', num2str(sum)])
