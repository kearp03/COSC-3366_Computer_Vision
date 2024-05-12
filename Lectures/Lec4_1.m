clear all
clc

%Structure
myStruct.name = 'sin(x) plot';
myStruct.x = -10:.1:10;
myStruct.y = sin(myStruct.x);

plot(myStruct.x, myStruct.y)
title(myStruct.name)