function n = unitvec(A, B)
    AB = B - A;
    n = AB / sqrt(sum(AB.^2));
end