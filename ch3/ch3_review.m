%% Chapter 3 Review

%% Generating Random Numbers

%{
- rand() generates random numbers between 0 and 1
    - Options: rand, rand(1,n), rand(n), rand(m,n), randperm(n)
    - Give random numbers between a and b: (b - a) * rand + a
- randi() generates random integers between 1 and the specified max
    - randi(imax), randi(imax,n), randi(imax,m,n)
    - randi([imin imax], m, n) for specific range
- randn() generates random numbers with mean 0 and s.d. 1
    - randn, randn(1,n), randn(n), randn(m,n)
    - sigma * randn + mu for mean mu, std sigma
    - round(sigma * randn + mu) for integers
%}

%% Addition & Subtraction

%{
A + B adds arrays element-by-elemnent
A - B subtracts arrays element-by-elemnent
- They should both match in dimensions
Scalar +/- matrix: scalar applied to every element
%}

vA = [8 5 4]; vB = [10 2 7];
disp(vA + vB);
disp(vA + vB');
disp(vA' + vB);
disp(vA + 4);

A = [5 -3 8; 9 2 10];
B = [10 7 4; -11 15 1];
disp(A + B);
disp(B - A);
disp(A - 10);
disp(vA + A);
% disp(vA' + A) causes an error with incompatible dimensions

%% Array Multiplication

%{
- Scalar * matrix: multiplies every element
- Matrix * matrix: linear algebra multiplication
    - A(m x n) * B(n x p) = C(m x p)
    - Not commutative
    - Row vector * column vector = scalar (dot product)
    - Column vector * row vector = matrix
%}

%% Systems of Linear Equations

%{
System of equations can be written as A*x = B
    - A: coefficient matrix
    - x: vector of unknowns
    - B: constants
%}

%% Array Division

%{
- A / scalar: elementwise division by scalar
- inv(A) or A^-1: inverse of square matrix A (if det(A) ≠ 0)
- Left division (\): solves A * x = B
- Right division (/): solves X * A = D
- Division is preferred to using inv(A): faster and less error
%}

A = [2 1 4; 4 1 8; 2 -1 3];
B = inv(A);
disp(A * B); disp(B * A);
disp(A * A^-1);

% Determinant
disp(det(A));

% Solving Ax = B
A = [4 -2 6; 2 8 2; 6 10 3];
B = [8; 4; 0];
X = A \ B; % solves the system
disp(X);

% It is preferred to do A\B because it's faster and more accurate
% than computing the inverse and multiplying


%% Element-by-Element Operations

%{
Use .*, ./, .\ , .^ for elementwise operations:
    A .* B  -> elementwise multiplication
    A. / B  -> elementwise right division
    A .\ B  -> elementwise left division
    A .^ n  -> elementwise exponentiation
%}

A = [2 6 3; 5 8 4];
B = [1 4 10; 3 2 7];
disp(A .* B);
% disp(A * B) causes an error because of a mismatch in dimensions
disp(A ./ B);
disp(A.^3);

z = 1:2:11;
disp((z.^3 + 5.*z)./(4.*z.^2-10));

%% Using Arrays in MATLAB Built-In Functions

%{
Most MATLAB functions operate elementwise on arrays (Vectorization).
%}

A = [1 4 9; 16 25 36; 49 64 81];
disp(sqrt(A))

x = 0:pi/6:pi;
disp(cos(x));

%% Built-In Functions for Analyzing Arrays

%{
mean(A)         - average
max(A)          - maximum
[d,n] = max(A)  - maximum and index
[d,n] = min(A)  - minimum and index
sum(A)          - sum of elements
sort(A)         - ascending order
median(A)       - median value
std(A)          - standard deviation
det(A)          - determinant (square matrix only)
dot(a,b)        - dot product
cross(a,b)      - cross product (must be 3-element vectors)
inv(A)          - inverse of square matrix

Note: for functions like mean, sum, sort, median, and std, if these are
called on matrices, it will calculate those values by columns.
%}

A = [5 9 2 4];
disp(mean(A));
disp(max(A));
disp(min(A));
disp(sum(A));
disp(sort(A));
disp(sort([2 6 3 4; 6 8 2 1]));
disp(median(A));
disp(std(A));

a = [1 3 2]; b = [2 4 1];
disp(dot(a, b));
disp(cross(a, b));