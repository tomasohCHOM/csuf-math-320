%% Math 320 - Chapter 3 Homework
% Tomas Oh

close all, clear, clc, format compact

%% Chapter 3, Problem #2

x = [1.5 2 2.5 3 3.5 4];
y = x.^4 .* exp(-x)

%% Chapter 3, Problem #3

x = -2:0.5:2;
y = (x + x .* sqrt(x+3)) .* (1 + 2 * x.^2) - x.^3

%% Chapter 3, Problem #6

u = 0.35;

% Part (a)
theta = [5 10 15 20 25 30 35];
F = 70 * u ./ (u * sind(theta) + cosd(theta))

% Part (b)
thetas = 5:0.01:35;
[F, idx] = min((70 * u) ./ (u * sind(thetas) + cosd(thetas)));
F, minTheta = thetas(idx)

%% Chapter 3, Problem #9

% Part (a)
u = [4 13 -7]

% Part (b)
Lu = sqrt(sum(u .* u))

% Part (c)
Un = u / Lu

% Part (d)
LUn = sqrt(sum(Un .* Un))

%% Chapter 3, Problem #10

u1 = [3.2 -6.8 9]; u2 = [-4 2 7];
angle = acosd(sum(u1 .* u2) / (sqrt(sum(u1.*u1)) * sqrt(sum(u2.*u2))))

%% Chapter 3, Problem #14

v = [5 4 3 2]

% Part (a)
a = 1./(v + v)

% Part (b)
b = v.^v

% Part (c)
c = v./sqrt(v)

% Part (d)
d = v.^2./b

%% Chapter 3, Problem #15

x = 0.5:0.5:2.5; y = 0.8:0.8:4;

% Part (a)
z = x.^2 + 2 * x .* y

% Part (b)
z = x.*y .* exp(y./x) - nthroot(x.^4.*y.^3 + 8.5, 3)

%% Chapter 3, Problem #18

r1 = [2.5 8 -5];
r2 = [-1 6 3];

r1xr2 = cross(r1, r2)
theta = asind(sqrt(sum(r1xr2.*r1xr2)) / (sqrt(dot(r1,r1))*sqrt(dot(r2,r2))))

%% Chapter 3, Problem #19

m = [0.5 0.8 0.2 1.1 0.4 0.9];
x = [-10 -18 -7 5 0 25]; y = [8 6 11 12 -8 -20]; z = [32 19 2 -9 -6 8];

X = sum(m.*x) / sum(m)
Y = sum(m.*y) / sum(m)
Z = sum(m.*z) / sum(m)

%% Chapter 3, Problem #23

format long

% Part (a)

n = 1:1:5;
a = sum(n .* n ./ 2.^n)

% Part (b)

n = 1:1:15;
b = sum(n .* n ./ 2.^n)

% Part (c)

n = 1:1:30;
c = sum(n .* n ./ 2.^n)

%% Chapter 3, Problem #26

format long

x = [1.0, 0.1, 0.01, 0.001, 0.0001];
y = 5 * sin(6.*x)./(4 * x);
diffs = 7.5 - y

%% Chapter 3, Problem #30

A = [[5 -3 7]; [1 0 -6]; [-4 8 9]];
B = [[3 2 -1]; [6 8 -7]; [4 4 0]];
C = [[-9 8 3]; [1 7 -5]; [3 3 6]];

% Part (a)

AB = A*B
BA = B*A

% Part (b)

BC_I = inv(B*C)
BIxCI = inv(B)*inv(C)

% Part (c)

AIT = inv(A)'
ATI = inv(A')

% Part (d)
ApBT = (A+B)'
ATpBT = A' + B'

%% Chapter 3, Problem #33

format short

A = [-2 5 7; 3 -6 2; 9 -3 8];
B = [-17.5; 40.6; 56.2];
X = A \ B

%% Chapter 3, Problem #36

v = [105; 74; 102; 118; 121] * 16;
A = [3 1 1 2 1; 1 2 1 0 2; 1 1 0 3 3; 2 3 3 1 0; 1 1 3 2 2];
X = A \ v