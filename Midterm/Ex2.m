clear all
clc

files = dir('MotionRectangle/*.jpg');

for i=1:size(files)
    % read next image file
    I = imread(['MotionRectangle/', files(i).name]);
    % find rows and columns of all the 1's
    [rows, columns] = find(I);
    % find borders of the rectangle
    [x1, x2] = bounds(rows);
    [y1, y2] = bounds(columns);
    % display next image and box
    figure
    imshow(I)
    hold on
    rectangle('Position', [y1, x1, y2 - y1, x2 - x1], 'EdgeColor', 'y', 'LineWidth', 3);
end