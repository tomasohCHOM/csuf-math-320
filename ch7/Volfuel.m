function V = Volfuel(y)
    R = 24;
    % Using the formula V = (pi * h^2 * (3R - h)) / 3
    V_in3 = (pi * y.^2 .* (3*R - y)) / 3;
    V = V_in3 / 231; % Covert to gallons
end