function [V, S] = VolSArea(r, R, h)
    % SA = pi(R + r)l + pi(R^2 + r^2), where l = sqrt(h^2 + (R - r)^2)
    l = sqrt(h^2 + (R - r)^2);
    S = pi * (R + r) * l + pi * (R^2 + r^2);
    % V = pi * h * (R^2 + Rr + r^2) / 3
    V = pi * h * (R^2 + R * r + r^2) / 3;
end