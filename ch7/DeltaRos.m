function [P1, P2] = DeltaRos(A, B, C)
    m = (A + B + C) / 3;
    n = (sqrt(2) / 3) * sqrt((A - B)^2 + (B - C)^2 + (C - A)^2);
    P1 = m + n; P2 = m - n;
end