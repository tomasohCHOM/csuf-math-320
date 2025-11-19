function th = anglines(A, B, C)
    BA = A - B; BC = C - B;
    BAmag = sqrt(sum(BA.^2)); BCmag = sqrt(sum(BC.^2));
    th = acosd(dot(BA, BC) / (BAmag * BCmag));
end