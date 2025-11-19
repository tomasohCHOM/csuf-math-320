function [th, rad] = CartToPolar(x, y)
    rad = sqrt(x^2 + y^2);
    th = atand(y / x);
    if and(x < 0, y > 0)
        th = 180 + th;
    elseif and(x < 0, y < 0)
        th = th - 180;
    end
end