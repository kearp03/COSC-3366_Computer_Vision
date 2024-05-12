clear all
clc

v = [3, 2, 1, 4, 5];

indexEntered = input('Enter index: ');
valueEntered = input('Enter value: ');

v(indexEntered) = valueEntered;

disp(v)