A = [1, 2, 3; 4, 5, 6; 7, 8, 9];
col = size(A,2);
mean = sum(sum(A(:,col-1:col)))/(size(A,1)*2);
disp(mean)