function p = polyadd(p1, p2, operation)
    n1 = length(p1); n2 = length(p2);
    if n1 > n2
        p2 = [zeros(1, n1 - n2), p2];
    elseif n2 > n1
        p1 = [zeros(1, n2 - n1), p1];
    end

    switch operation
        case 'add'
            p = p1 + p2;
        case 'sub'
            p = p1 - p2;
    end
end