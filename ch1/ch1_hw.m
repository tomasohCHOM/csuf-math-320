%% Math 320 - Chapter 1 Homework
% Tomas Oh

close all, clear, clc, format compact

%% Chapter 1, Problem #2

%Part (a)
a = (8 + 80/2.6)^(1/3) + exp(3.5)

%Part (b)
b = (1/sqrt(75) + 73/(3.1^3))^(1/4) + 55*0.41

%% Chapter 1, Problem #5

%Part (a)
a = sin(0.2*pi) / cos(pi/6) + tand(72)

%Part (b)
b = (tand(64) * cosd(15))^2 + (sind(37)^2 / cosd(20)^2)

%% Chapter 1, Problem #6

z = 4.5;

%Part (a)
a = 0.4*z^4 + 3.1*z^2 - 162.3*z - 80.7

%Part (b)
b = (z^3 - 23) / ((z^2 + 17.5)^(1/3))

%% Chapter 1, Problem #9

%Part (a)
c = 4.6; d = 1.7; a = c*d^2; b = (c+a)/(c-d);
a = exp(d - b) + (c + a)^(1/3) - (c*a)^d

%Part (b)
t = 1;
b = d/c + (c*t/b)^2 - c^d - a/b

%% Chapter 1, Problem #16

%Part (a)
r1 = 15; r2 = 10.5; r3 = 4.5;
a = r2 + r3; b = r1 + r3; c = r1 + r2;
gamma = acosd((c ^ 2 - a ^ 2 - b ^ 2) / (a * b * (-2)))

%Part (b)
alpha = asind(a*(sind(gamma) / c))
beta = asind(b*(sind(gamma) / c))

%Part (c)
sum = alpha + beta + gamma

%% Chapter 1, Problem #21

a = 18; b = 7;
P = pi*(a + b)*(3 - (sqrt((3*a + b)*(a + 3*b)))/(a + b))

%% Chapter 1, Problem #28

%Part (a)
n = 26; r = 6;
P = factorial(n) / factorial(n - r)

%Part (b)
n = 36;
P = factorial(n) / factorial(n - r)

%% Chapter 1, Problem #32

k = log(0.5) / 5730;
t = round(log(0.7745) / k)

%% Chapter 1, Problem #34

M = 9.2;

%Part (a)
E = 1.74 * 10^19 *10^(1.44*M)

%Part (b)
M = log10(E / (2*1.74 * 10^19)) / 1.44

%% Chapter 1, Problem #39

n = 19;
approxVal = sqrt((2*n + 1/3)*pi) * n^n * exp(-n)
trueVal = factorial(n);
Error = (trueVal - approxVal) / trueVal
