function P = ProbLottery(m, r, n)
    P = (Combinations(r, m) * Combinations(n - r, r - m)) / ...
         Combinations(n, r);
end

function C = Combinations(x, y)
    C = factorial(x) / (factorial(y) * factorial(x - y));
end