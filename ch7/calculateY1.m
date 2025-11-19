function y = calculateY1(x)
    y = 0.6 * x.^3 .* exp(-0.47 * x) + 1.5 * x.^2 .* exp(-0.6 * x);
end