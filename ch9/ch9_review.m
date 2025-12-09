%% Chapter 9 Review

%% Solving an Equation with One Variable

%{
An equation with one variable can be written as f(x) = 0:
- A solution (or root) is the numeric value x that satisfies the equation
- A numerical solution is a value of x where f(x) is exact or almost 0


In MATLAB, a zero of a function can be found using x = fzero(function, x0):
- fzero is a function function, accepting a function to be solved
- x0 is a value of x close to where the function crosses the axis
- x is the numerical solution as a scalar
- fzero only solves f(x) = 0
%}

f = @(x) x.^2 - 1;
r = fzero(f, 3);
disp(r);
r = fzero(f, -2);
disp(r);

g = @(x) sin(x) - 1/2;
rs = fzero(g, 1);
disp(rs); % Finds the root closest to 1: pi/6
rt = fzero(g, 3);
disp(rt); % Finds the root closest to 3: 5pi/6

%{
Notes about fzero:
- x0 can be a scalar or a two-element vector:
    - If x0 is a scalar, it must be a value near the root
    - If x0 is a vector, the two elements need to be on opposite sides
        >> f = @(x) x.^2 - 1;
        >> r = fzero(f, [0, 2]); % Fine, r = 1
        >> r = fzero(f, [2, 3]); % Not fine
- The fzero command finds zeros of a function when it CROSSES the x-axis.
  Touching the x-axis (y == 0) does not count
- [x, fval] = fzero(fun, x0) returns the value of the function at x too
%}

%% Finding a Minimum or Maximum of a Function

%{
Finding the minimum of a function: [x, fval] = fminbnd(function, x1, x2)
- function must be a continuous single-variable function
- x1 and x2 are the intervals surrounding the min x-value (x1 < x < x2)
- It does not evaluate the function at the endpoints

Find the maximum of a function by finding the minimum of its negative!
%}

f = @(x) x.^3 - 12 * x.^2 + 40.25 * x - 36.5;
fplot(f, [0, 8]);
[xmin, fmin] = fminbnd(f, 5, 7);
disp(xmin); disp(fmin);
nf = @(x) -f(x);
[xmax, fmax] = fminbnd(nf, 1, 3);
disp(xmax); disp(fmax);

%% Numerical Integration

%{
Some commands:
- q = quad(function, a, b)
- q = quadl(function, a, b)
- q = trapz(x, y)
    - x and y are vectors (same length, values of x must be ascending)
%}

f = @(x) x .* exp(-x.^0.8) + 0.2;
q1 = quad(f, 0, 8);
q2 = quadl(f, 0, 8);
disp(q1); disp(q2);

%% Ordinary Differential Equations (ODE)

%{
An initial value problem (IVP) is a first-order ODE with an initial
condition. Standard form:
- dy/dt = f(t, y) for t0 <= t <= tf, with y = y0 at t = t0

Solving an IVP in Matlab:
1. Write the problem in standard form
2. Create a function for f(t, y)
3. Solve the ODE using:
    [t, y] = solver_name(ODEfun, tspan, y0)
    - Different ODE solvers: ode45, ode23, ode113, etc.
    - tspan is a vector of 2+ elements specifying the solution interval
    - y0 is the initial value of y
%}

f = @(t, y) (t.^3 - 2 .* y) ./ t;
[t, y] = ode45(f, 1:0.5:3, 4.2);
disp(t); disp(y);
[t, y] = ode45(f, [1, 3], 4.2);
plot(t, y);
