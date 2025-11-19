function d3 = det3by3(A)
    d3 = A(1, 1) * det2By2([A(2, 2), A(2, 3); A(3, 2), A(3, 3)]) ...
         - A(1, 2) * det2By2([A(2, 1), A(2, 3); A(3, 1), A(3, 3)]) ...
         + A(1, 3) * det2By2([A(2, 1), A(2, 2); A(3, 1), A(3, 2)]);
end

function d2 = det2By2(A)
    d2 = A(1, 1) * A(2, 2) - A(1, 2) * A(2, 1);
end