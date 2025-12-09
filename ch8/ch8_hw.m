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

p1 = [8, 10, 0, -5, 13, -4, 2]; p2 = [0, 0, 4, 0, 7, 0, 6];
polyadd(p1, p2, 'add')
polyadd(p1, p2, 'sub')

%% Chapter 8, Problem #17

[x, y, w] = maxormin(3, -7, 14) % Part (a)
[x, y, w] = maxormin(-5, -11, 15) % Part (b)

%% Chapter 8, Problem #22

years = [1815, 1845, 1875, 1905, 1935, 1965];
population = [8.3, 19.7, 44.4, 83.2, 127.1, 190.9];
p = polyfit(years, population, 2);
xs = 1815:0.1:1965;
ys = polyval(p, xs);
plot(xs, ys);
xlabel('Year');
ylabel('Population (millions)');
title('Population Growth Over Time');
grid on;

%% Chapter 8, Problem #26

x = [1, 2.2, 3.7, 6.4, 9, 11.5, 14.2, 17.8, 20.5, 23.2];
y = [12, 9, 6.6, 5.5, 7.2, 9.2, 9.6, 8.5, 6.5, 2.2];

p1 = polyfit(x, y, 1); p2 = polyfit(x, y, 2);
p3 = polyfit(x, y, 3); p5 = polyfit(x, y, 5);

xs = linspace(1, 23.2, 200);
ys1 = polyval(p1, xs); ys2 = polyval(p2, xs);
ys3 = polyval(p3, xs); ys5 = polyval(p5, xs);

hold on;
plot(xs, ys1); plot(xs, ys2);
plot(xs, ys3); plot(xs, ys5);
hold off;

title('Polynomial Fits (1st, 2nd, 3rd, 5th)');
xlabel('x'); ylabel('y');
grid on; legend('1st Order', '2nd Order', '3rd Order', '5th Order');

%% Chapter 8, Problem #31

t = 0.5:0.5:6.0;
C = [1.7, 3.1, 5.7, 9.1, 6.4, 3.7, 2.8, 1.6, 1.2, 0.8, 0.7, 0.6];

t_est = 2.25;
ts = linspace(0.5, 6, 200);

% Part (a)

CestLinear = interp1(t, C, t_est, 'linear');
CsLinear = interp1(t, C, ts, 'linear');

% Part (b)

CestSpline = interp1(t, C, t_est, 'spline');
CsSpline = interp1(t, C, ts, 'spline');

subplot(1, 2, 1);
plot(t, C);
hold on;
plot(t_est, CestLinear);
plot(ts, CsLinear);
title('Linear Interpolation');
xlabel('Time (h)');
ylabel('Concentration');
grid on;

subplot(1, 2, 2)
plot(t, C);
hold on;
plot(t_est, CestSpline);
plot(ts, CsSpline);
title('Spline Interpolation');
xlabel('Time (h)');
ylabel('Concentration');
grid on;
