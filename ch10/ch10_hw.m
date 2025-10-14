%% Math 320 - Chapter 10 Homework
% Tomas Oh

close all, clear, clc, format compact

%% Chapter 10, Problem #2

n = 4; h = 50;
t = 0:0.1:2*pi*n;
r = h * (2 + 5 * sin(t / 8)) / 10;
x = r .* cos(t);
y = r .* sin(t);
z = (h * t) / (2 * pi * n);
plot3(x, y, z);
xlabel('x (m)');
ylabel('y (m)');
zlabel('z (m)');
grid on;

%% Chapter 10, Problem #4

x = -4:0.1:4; y = -3:0.1:3;
[X, Y] = meshgrid(x, y);
Z = X.^2 / 4 + 2 * (sin(0.7 * Y)).^2;
surf(X, Y, Z);

%% Chapter 10, Problem #7

x = -5:0.1:5; y = -5:0.1:5;
[X, Y] = meshgrid(x, y);
R = sqrt(X.^2 + Y.^2);
Z = -cos(2 * R) ./ exp(0.2 * R);
mesh(X, Y, Z);

%% Chapter 10, Problem #9

r_max = 2;
theta = 0:0.1:2*pi; r = 0:0.1:r_max; phi = linspace(0, pi / 2, 50);
[TH, R] = meshgrid(theta, r);
X_cone = R .* cos(TH);
Y_cone = R .* sin(TH);
Z_cone = 4 * R;

[TH, PHI] = meshgrid(theta, phi);
X_sphere = r_max * sin(PHI) .* cos(TH);
Y_sphere = r_max * sin(PHI) .* sin(TH);
Z_sphere = r_max * cos(PHI) + 8; % shift to the top

surf(X_cone, Y_cone, Z_cone);
hold on;
surf(X_sphere, Y_sphere, Z_sphere);
hold off;
axis equal;
grid on;

%% Chapter 10, Problem #10

theta = -20:0.1:20; a_over_lambda = 2:0.1:10;
[TH, AL] = meshgrid(theta, a_over_lambda);
alpha = pi * AL .* sind(TH);
I = (sin(alpha) ./ alpha).^2;
surf(TH, AL, I);

%% Chapter 10, Problem #11

v = 0:1000; t = 70:320; R = 8.31; M = 0.032;
[V, T] = meshgrid(v, t);
P = 4 * pi * (M ./ (2 * pi * R .* T)).^(3/2) .* V.^2 .* exp(-M .* V.^2 ./ (2 * R .* T));
surf(V, T, P);

%% Chapter 10, Problem #19

r = 0.1; N0 = 10;
t = linspace(0, 100, 200); N_inf = linspace(100, 1000, 200);
[T, N_INF] = meshgrid(t, N_inf);
N = N_INF ./ (1 + (N_INF ./ N0 - 1) .* exp(-r .* T));
mesh(T, N_INF, N);
xlabel('Time (t)');
ylabel('Maximum Population N_\infty');
zlabel('Population N(t)');

%% Chapter 10, Problem #20

B = 1.2; L = 4; T = 0.5;
x = -2:0.1:2; z = -0.5:0.1:0;
[X, Z] = meshgrid(x, z);
Y_POS = (B / 2) * (1 - (2 * X ./ L).^2) .* (1 - (2 * Z ./T).^2);
Y_NEG = -(B / 2) * (1 - (2 * X ./ L).^2) .* (1 - (2 * Z ./T).^2);
surf(X, Y_POS, Z);
hold on;
surf(X, Y_NEG, Z);
hold off;
xlabel('x');
ylabel('y');
zlabel('z');