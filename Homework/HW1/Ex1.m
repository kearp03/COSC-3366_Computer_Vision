clear all
clc

temperature = 75;

if temperature < 0
    disp('It is below zero')
elseif temperature < 40
    disp('It is cold')
elseif temperature < 80
    disp('It is mild')
else
    disp('It is hot')
end