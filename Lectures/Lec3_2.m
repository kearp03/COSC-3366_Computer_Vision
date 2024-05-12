a = randi(100, 5, 1);

if a < 30
    disp('small')
elseif a < 80
    disp('medium')
else
    disp('large')
end

x=1;

switch x
    case 0
        disp('Zero')
    case 1
        disp('One')
end