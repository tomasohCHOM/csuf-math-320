%% Math 320 - Chapter 8 Homework
% Tomas Oh

close all, clear, clc, format compact

%% Chapter 8, Problem #1

x = -4:0.1:4;
p = [0.9, -0.3, -15.5, 7, 36, -7];
y = polyval(p, x);
plot(x, y);

%% Chapter 8, Problem #5

% Given x(x + 1.8)(x - 0.4)(x - 1.6), the roots are x = 0, -1.8, 0.4, 1.6
r = [0, -1.8, 0.4, 1.6];
p = poly(r);
x = -2:0.1:2;
y = polyval(p, x);
plot(x, y);

%% Chapter 8, Problem #6

u = [-9, 12, 5, -9, 17, -7, 15]; v = [3, -2, -3];
[q, r] = deconv(u, v)

%% Chapter 8, Problem #8

% Product of four consecutive even integers. Let the first be n, then:
% n(n + 2)(n + 4)(n + 6) = 1,488,384
p = conv(conv([1, 0], [1, 2]), conv([1, 4], [1, 6]));
p(end) = -1488384;
r = roots(p) % Ignoring imaginary roots, the integers are 32 and -38

%% Chapter 8, Problem #13

% SA = x(x + 18) + 2xh + 2(x + 18)h = x^2 + 18x + h(4x + 36) = 2500
% h = (2500 - x^2 - 18x) / (4x + 36)
% V = x(x + 18)h = x(x + 18)(- x^2 - 18x + 2500) / (4x + 36)
conv(conv([1, 0], [1, 18]), [-1 -18 2500]);

%% Chapter 8, Problem #14

% 1/100,000 <= 6/(n(n - 1)(n - 2)) <= 1/95,000
% 570,000 <= n(n - 1)(n - 2) <= 600,000
ineq1 = [1, -3, 2, -570000]; ineq2 = [1, -3, 2, -600000];
roots(ineq1)
roots(ineq2)

%% Chapter 8, Problem #15



%% Chapter 8, Problem #17



%% Chapter 8, Problem #22



%% Chapter 8, Problem #26



%% Chapter 8, Problem #31