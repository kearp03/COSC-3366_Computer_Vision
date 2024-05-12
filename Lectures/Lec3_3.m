% a for loop
for v = 1.0:-0.2:0.0
    disp(v)
end

% a while loop
n = 10;
f = n;
while n > 1
    n = n-1;
    f = f*n;
end
%{ 
to print with variable values:
use square brackets,
and built in converter function
%}
disp(['n! = ' num2str(f)])