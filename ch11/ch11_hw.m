%% Math 320 - Chapter 11 Homework
% Tomas Oh

close all, clear, clc, format compact

%% Chapter 11, Problem #3

syms x y;
S = sqrt(y) + x; T = y - sqrt(y) * x + x^2;
simplify(S * T)
subs(S, {x, y}, {5, 4})

%% Chapter 11, Problem #4

syms x;

% Part (a)
S = (x + 3) * (x - 1) * (x + 0.5) * (x - 2) * (x - 4);
expand(S)

% Part (b)
F = x^6 - 2 * x^5 - 39 * x^4 + 20 * x^3 + 404 * x^2 + 192 * x -576;
factor(F)

%% Chapter 11, Problem #5

syms x;

% Part (a)
lhs = sin(3 * x), rhs = 3 * sin(x) - 4 * (sin(x))^3;
simplify(rhs) % Outputs sin(3 * x)

% Part (b)
lhs = 1/2 * sin(6 * x)
rhs = (3 * sin(x) - 4 * (sin(x))^3) * (4 * (cos(x))^3 - 3 * cos(x));
simplify(rhs) % Outputs sin(6 * x) / 2

%% Chapter 11, Problem #10

syms x y;
S1 = (x - 1)^2/6^2 + y^2/3^2 == 1;
S2 = (x + 1)^2/2^2 + (y - 5)^2/4^2 == 1;

% Part (a)
ezplot(S1);
hold on;
ezplot(S2);
hold off;

% Part(b)
sol = solve([S1, S2], [x, y], 'Real', true);
double(sol.x)
double(sol.y)

%% Chapter 11, Problem #12

syms x h m g u F N;

% Part (a)
S1 = -F * (x / sqrt(x^2 + h^2)) + u * N == 0;
S2 = -m * g + N + F * (h / sqrt(x^2 + h^2)) == 0;
sol = solve([S1, S2], [F, N]);
sol.F

% Part (b)
F_expr = subs(sol.F, {m, h, u, g}, {18, 10, 0.55, 9.81})

% Part (c)
ezplot(F_expr, [5, 30]);


%% Chapter 11, Problem #18

syms x;
S = 6 * (sin(x))^2 / (3 * sin(x) + 1)^2;
ezplot(S, [0, pi]);
int(S, 0, pi)

%% Chapter 11, Problem #24

% Part (a)
syms A B x m t;
u = (A / sqrt(t)) * exp(-x^2 / (4 * m * t)) + B;
dudt = diff(u, t);
d2udx2 = diff(u, x, 2);
simplify(dudt - m * d2udx2)

%% Chapter 11, Problem #26

% Part (a)
syms m g c v(t);
ode = m * g - c * v == m * diff(v, t);
cond = v(0) == 0;
sol = dsolve(ode, cond)

% Part (b)
solvedC = double(solve(28 == subs(sol, {m, g, t}, {90, 9.81, 4})))

% Part (c)
ezplot(subs(sol, {m, g, c}, {90, 9.81, solvedC}), [0, 30]);

%% Chapter 11, Problem #29

syms y(t);
ode = diff(y, t, 2) - 0.08 * diff(y, t) + 0.6*t == 0;
conds = [y(0) == 2, subs(diff(y, t), t, 0) == 3];
sol = dsolve(ode, conds)
fplot(sol, [0, 7])
grid on;

%% Chapter 11, Problem #31

syms x(t);
m = 10; k = 28; x0 = 0.18; v0 = 0;

% Part (a)
c = 3; t_bounds = [0, 20];
ode = m * diff(x, t, 2) + c * diff(x, t) + k * x == 0;
conds = [x(0) == x0, subs(diff(x, t), t, 0) == v0];
xsol = dsolve(ode, conds)
vsol = diff(xsol, t)

subplot(2, 1, 1);
ezplot(xsol, t_bounds);
hold on;
ezplot(vsol, t_bounds);
hold off;
title('Position x and velocity v over time (c = 3)');

% Part (b)
c = 50; t_bounds = [0, 10];
ode = m * diff(x, t, 2) + c * diff(x, t) + k * x == 0;
conds = [x(0) == x0, subs(diff(x, t), t, 0) == v0];
xsol = dsolve(ode, conds)
vsol = diff(xsol, t)

subplot(2, 1, 2);
ezplot(xsol, t_bounds);
hold on;
ezplot(vsol, t_bounds);
hold off;
title('Position x and velocity v over time (c = 50)');