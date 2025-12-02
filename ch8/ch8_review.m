%% Chapter 8 Review

%% Polynomials & Roots of a Polynomial

%{
f(x) = ax^n + bx^(n - 1) + ... + cx + d with real coefficients and n is the
degree or order of the polynomial (nonnegative):
- in MATLAB, a polynomial is represented with a vector of length n + 1
- the vector must include all coefficients, even the ones that are 0

The value of a polynomial at a point x can be evaluated as:
- polyval(p, x) (x can be a number, vector, or matrix)

r = roots(p) gives us a column vector r with the roots of the polynomial p.
p = poly(r) gives us a row vector p with the polynomial coefficients.
%}

p = [2, -4, -12];
disp(polyval(p, 9));
x = linspace(-5, 7, 200);
y = polyval(p, x);
plot(x, y); % Plotting a polynomial
r = roots(p);
hold on;
plot(r(1), 0, '.', 'MarkerSize', 20);
plot(r(2), 0, '.', 'MarkerSize', 20);

%% Addition, Multiplication, and Division of Polynomials

%{
Addition/Subtraction:
- Add (or subtract) the coefficient vectors. They must be of the same size.
  We do so by padding zeros to the polynomial vector with lower degree.

Multiplication:
- c = conv(a, b) (c is a row vector, a & b can be of different degrees).

Division:
- [q, r] = deconv(u, v) (u is the nominator, v is the denominator)
- q is the quotient polynomial and r is the remainder polynomial
%}

%% Derivatives of Polynomials

%{
k = polyder(p) (Derivative of a single polynomial)
k = polyder(a, b) (Derivative of the product of the polynomials a & b)
[n, d] = polyder(u, v) (Derivative of a quotient of polynomials u & v)
%}

f1 = [3, -2, 4]; f2 = [1, 0, 5];
k = polyder(f1);
disp(k);
P = polyder(f1, f2);
disp(P);
[n, d] = polyder(f1, f2);
disp(n); disp(d);

%% Curve Fitting

%{
Curve fitting or regression analysis: the process of fitting a function so
it lays as closely as possible to a set of data points.

Two ways to fit a polynomial to data points:
- The polynomial must pass through every point
- The polynomial does not need to pass through every point

Polynomials that pass through all data points:
- Given n data points (xi, yi), we can make a polynomial of degree n - 1
  that passes through all n points.

Polynomials that do not need to pass through all data points:
- Most common method: least-squares fit

In MATLAB:
- p = polyfit(x, y, n) (uses the least squares method for the coefficients)
- x is the vector for horizontal coordinates, y is for vertical coordinates
- n is the desired degree of the polynomial:
    - With m data points, n <= m - 1.
    - If n = m - 1, it will go through all the points, but not if n < m - 1
    - A polynomial of degree m - 1 may not necessarily provide the best
      overall fit if it deviates substantially between points
%}

x = [1, 2, 3]; y = [4, 10, 3];
figure(1);
plot(x, y, '.', 'MarkerSize', 20);
xlabel('x'); ylabel('y');
axis([0, 4, 1, 12]);

p1 = polyfit(x, y, 1); % Best-fit Line
xs = 0:0.1:4;
ys1 = polyval(p1, xs);
hold on;
plot(xs, ys1, 'LineWidth', 1);

p2 = polyfit(x, y, 2); % Best-fit Parabola
ys2 = polyval(p2, xs);
plot(xs, ys2, 'LineWidth', 1);
legend('data', 'line', 'parabola');
hold off;

%{
Curve Fitting with Functions that are not Polynomials:
- Power: y = bx^m               ->  p = polyfit(log(x), log(y), 1);
- Exponential: y = be^(mx)      ->  p = polyfit(x, log(y), 1);
- Logarithmic: y = mln(x) + b   ->  p = polyfit(log(x), y, 1);
- Reciprocal: y = 1 / (mx + b)  ->  p = polyfit(x, 1 ./ y, 1);
%}

%% Interpolation

%{
Interpolation: the estimation of values between data points.
Linear interpolation; the process of estimating values between two data
points by connecting points with a straight line and using the value on the
line as the estimated value.

One-dimensional linear interpolation in MATLAB:
- yi = interp1(x, y, xi, 'method'); (x must be monotonic)
- xi is the horizontal coordinate of the interpolation point: scalar/vector
- yi is a scalar or vector with the corresponding interpolated values
- methods: 'nearest', 'linear', 'spline', 'pchip' (or 'cubic)
%}

x = [1, 2, 6, 8, 9]; y = [3, 8, 1, 2, 3];
plot(x, y, '.', 'MarkerSize', 25);

% Find and plot the linear interpolation points
xi = [1.5, 4, 7, 8.5];
yLin = interp1(x, y, xi);
hold on;
plot(xi, yLin, '*m', 'MarkerSize', 10);

% Find and plot the hermite interpolation points
yPch = interp1(x, y, xi, 'pchip');
plot(xi, yPch, 'pb', 'MarkerSize', 10);
hold off;

%% The Basic Fitting Interface

%{
To active this interactive tool:
- Plot data points
- In the Figure Window > Tools > Basic Fitting
%}

x = [1, 2, 6, 8, 9]; y = [3, 8, 1, 2, 3];
plot(x, y, 'dm', 'MarkerSize', 25);
