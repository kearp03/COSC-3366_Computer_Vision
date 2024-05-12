clear all
clc

v = [10, 22, 30, 40, 50];

[cosA, sinA, tanA] = myFunction(v);

disp(['cos(v) = ', num2str(cosA)])
disp(['sin(v) = ', num2str(sinA)])
disp(['tan(v) = ', num2str(tanA)])