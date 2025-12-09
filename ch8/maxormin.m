function [x, y, w] = maxormin(a, b, c)
    x = -b / (2 * a);
    y = a * x^2 + b * x + c;
    if a < 0
        w = 1;
    else
        w = 2;
    end
end