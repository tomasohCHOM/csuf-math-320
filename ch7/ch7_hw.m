%% Math 320 - Chapter 7 Homework
% Tomas Oh

close all, clear, clc, format compact

%% Chapter 7, Problem #1

% Part (a)

yNeg2 = calculateY1(-2), yFour = calculateY1(4)

% Part (b)

x = linspace(-4, 8, 200);
y = calculateY1(x);
plot(x, y);

%% Chapter 7, Problem #2

% Part (a)

rPi6 = calculateR2(pi / 6), r5Pi6 = calculateR2(5 * pi / 6)

% Part (b)

theta = linspace(0, 4 * pi, 200);
r = calculateR2(theta);
polarplot(theta, r);

%% Chapter 7, Problem #7

BodySurA(170, 5 * 12 + 10)  % Part (a) (170lb, 5ft 10in)
BodySurA(220, 6 * 12 + 5)   % Part (a) (220lb, 6ft 5in)

%% Chapter 7, Problem #8

y = linspace(0, 24, 200);
V = Volfuel(y);
plot(y, V);

%% Chapter 7, Problem #9

[V, S] = VolSArea(2, 3.5, 4.25) % Part (a) (r = 2in, R = 3.5in, h = 4.25in)
[V, S] = VolSArea(2.5, 3.5, 4.5) % Part (a) (r = 2.5in, R = 3.5in, h = 4.5in)

%% Chapter 7, Problem #12

% Part (a) - A(–5, –1, 6), B(2.5, 1.5, –3.5), C(–2.3, 8, 1)
anglines([-5, -1, 6], [2.5, 1.5, -3.5], [-2.3, 8, 1])
% Part (b) - A(-5.5, 0), B(3.5, -6.5), C(0, 7)
anglines([-5.5, 0], [3.5, -6.5], [0, 7])

%% Chapter 7, Problem #14

unitvec([-0.7, 2.1], [9, 18]) % Part (a)
unitvec([10, -3.5, -2.5], [-11, 6.5, 5.9]) % Part (b)

%% Chapter 7, Problem #15