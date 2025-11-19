function w = crosspro(u, v)
    % Making the assumption that length(u) == length(v)
    if length(u) == 2
        u = [u 0]; v = [v 0];
    end
    w = [ u(2)*v(3) - u(3)*v(2), ...
          u(3)*v(1) - u(1)*v(3), ...
          u(1)*v(2) - u(2)*v(1) ];
end