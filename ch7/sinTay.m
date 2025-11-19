function y = sinTay(x)
    x = deg2rad(rem(x, 360));
    E = 1; Sn = x; n = 1;
    while E > 0.000001
        Sn1 = Sn;
        Sn = Sn + ((-1)^n / factorial(2*n + 1)) * x^(2*n + 1);
        E = abs((Sn - Sn1) / Sn1);
        n = n + 1;
    end
    y = Sn;
end