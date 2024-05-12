function min = mymin(v)
    min = v(1);
    for i = 2:length(v)
        if min > v(i)
            min = v(i);
        end
    end
end