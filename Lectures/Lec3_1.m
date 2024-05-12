%Clears variables from workspace
clear all
%Clears command window
clc

A = [1 2 3; 4 5 6; 7 8 9];
B = [10 2 30; 4 5 6; 7 8 9];
C = [1 2 3; 4 5 6; 7 80 90];
D = [-1 -2 -3; 4 5 6; 7 800 900];

%This is a comment
ThreeDarray(:,:,1) = A;
ThreeDarray(:,:,2) = B;
ThreeDarray(:,:,3) = C;
ThreeDarray(:,:,4) = D

%{
This
is a 
block
comment
%}

%%
disp('Hello')
disp('End of program')