%% Math 320 - Chapter 5 Homework
% Tomas Oh

close all, clear, clc, format compact

%% Chapter 5, Problem #7

f = @(x) sin(2 * x) .* (cos(0.5 * x)).^2;
fp = @(x) 2*cos(2 * x) .* (cos(0.5 * x)).^2 - 0.5 * sin(2 * x) .* sin(x);

fplot(f, [-pi, 2 * pi]);
hold on;
fplot(fp, [-pi, 2 * pi], '--');
xlabel('x');
ylabel('y');
legend('f(x)', 'f''(x)');
hold off;

%% Chapter 5, Problem #9

x = @(t) 0.7 * sin(10 * t);
y = @(t) 1.2 * sin(8 * t);
fplot(x, y, [0, pi]);
axis([-1.5, 1.5, -1.5, 1.5]);

%% Chapter 5, Problem #16

x = @(t) (3.3 - 0.3 * t.^2) .* cos(t);
y = @(t) (3.3 - 0.4 * t.^2) .* sin(t);
fplot(x, y, [-4, 4], 'LineWidth', 15);
axis([-2, 4, -3, 3]);

%% Chapter 5, Problem #17

theta = linspace(0, 5 * pi, 200);
posR = sqrt(theta); negR = -sqrt(theta);
polar(theta, posR);
hold on;
polar(theta, negR);
hold off;

%% Chapter 5, Problem #18

n = 1:100; theta = deg2rad(n * 135.7);
r = sqrt(n);
polar(theta, r, 'o');

%% Chapter 5, Problem #21

t = 10:10:70; H_data = [9, 22, 44, 63, 80, 94, 97];
H = @(t) 100.8 ./ (1 + 23 * exp(-0.093 * t));

plot(t, H_data, '.');
hold on;
fplot(H, [10, 70]);
hold off;
xlabel('Time t (in days)');
ylabel('Height H (in inches)');
legend('Data points', 'Logistic Function H', 'Location', 'SE');

%% Chapter 5, Problem #27

c = 3 * 10^8; h = 6.626 * 10^(-34); k = 1.38 * 10^(-23);

% We need to convert l, which is in micrometers, to meters
R = @(l, T) ((2 * pi * h * c^2) ./ ((l * 1e-6).^5)) .* ...
             (1 ./ (exp((h * c) ./ ((l * 1e-6) * k * T)) - 1));

T1 = 3000; T2 = 4000; T3 = 5000;
wavelengthBounds = [0.1, 3];

fplot(@(l) R(l, T1), wavelengthBounds, ':');
hold on;
fplot(@(l) R(l, T2), wavelengthBounds, '--');
fplot(@(l) R(l, T3), wavelengthBounds);
hold off;
xlabel('Wavelength (\mum)');
ylabel('Spectral Energy Density (W/m^{3})');
legend('T=3,000K', 'T=4,000K', 'T=5,000K');

%% Chapter 5, Problem #32

x = @(t) 4.219 * (exp(-1.58 * t) - exp(-6.32 * t));
v = @(t) 26.67 * exp(-6.32 * t) - 6.67 * exp(-1.58 * t);
bounds = [0, 4];
subplot(2, 1, 1);
fplot(x, bounds);
subplot(2, 1, 2);
fplot(v, bounds);

%% Chapter 5, Problem #34

f1 = 130; f2 = 120;
y = @(t) 2 * cos(2 * pi * (f1 + f2) / 2 * t) .* cos(2 * pi * (f1 - f2) / 2 * t);
fplot(y, [0, 0.3]);
xlabel('Time (s)');
ylabel('Amplitude');

%% Chapter 5, Problem #37

x1 = [0, 8]; x2 = [8, 12]; x3 = [12, 20];
V1 = @(x) 400 - 200 * x;
V2 = @(x) -1200 + x * 0;
V3 = @(x) -250 * x + 5000;

subplot(2, 1, 1);
fplot(V1, x1);
hold on;
fplot(V2, x2);
fplot(V3, x3);
hold off;

M1 = @(x) -100 * x.^2 + 400 * x;
M2 = @(x) -1200 * x + 6400;
M3 = @(x) -125 * (x - 12).^2 + 2000 * x - 32000;

subplot(2, 1, 2);
fplot(M1, x1);
hold on;
fplot(M2, x2);
fplot(M3, x3);
hold off;

%% Chapter 5, Problem #38

Q = 300;
D = linspace(100,2000,500);
L0_1 = 5; L0_2 = 10; L0_3 = 20;
Lc1 = L0_1 ./ (1 + (2.5 .* D.^(2/3)) ./ sqrt(Q));
Lc2 = L0_2 ./ (1 + (2.5 .* D.^(2/3)) ./ sqrt(Q));
Lc3 = L0_3 ./ (1 + (2.5 .* D.^(2/3)) ./ sqrt(Q));

plot(D, Lc1);
hold on;
plot(D, Lc2);
plot(D, Lc3);
hold off;
xlabel('Depth of filter (m)');
ylabel('Effluent BOD (mg/L)');
legend('L_{0} = 5 mg/L', 'L_{0} = 10 mg/L', 'L_{0} = 20 mg/L');

% L0_1 ~= 1000m depth, L0_2 ~= 1600m depth, L0_3 > 2000m

%% Chapter 5, Problem #40

bounds = [0, 4.5];
hold on;
fplot(@(x) sin(x).^2, bounds);
fplot(@(x) x.^2 - x.^4/3, bounds, '--');
fplot(@(x) x.^2 - x.^4/3 + 2 * x.^6/45, bounds, ':');
fplot(@(x) x.^2 - x.^4/3 + 2 * x.^6/45 - x.^8/315 + x.^10/14175, bounds, '-.');
hold off;
xlabel('x');
ylabel('sin^{2}(x)');
axis([-1, 5, 0, 1.5]);
legend('sin^{2}(x)', 'Two terms', 'Three terms', 'Five terms');