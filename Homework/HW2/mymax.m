function max = mymax(v)
    max = v(1);
    for i = 2:length(v)
        if max < v(i)
            max = v(i);
        end
    end
end