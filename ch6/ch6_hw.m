%% Math 320 - Chapter 6 Homework
% Tomas Oh

close all, clear, clc, format compact

%% Chapter 6, Problem #2

d = 6; e = 4; f = -2;

% Part (a)

y = d + f >= e > d - e

% Part (b)

y = e > d > f

% Part (c)

y = e - d <= d - e == f / f

% Part (d)

y = (d / e * f < f) > -1 * (e - d) / f

%% Chapter 6, Problem #4

v = [-2, 4, 1, 0, 2, 1, 2]; w = [2, 5, 0, 1, 2, -1, 3];
u = v(v <= w)

%% Chapter 6, Problem #6

mat = zeros(4, 6);
for r = 1:4
    for c = 1:6
        mat(r, c) = 2 * r - 3 * c;
    end
end
disp(mat);

%% Chapter 6, Problem #9

inputVector = input('Enter your desired vector: ')
modified = inputVector(inputVector >= 0)

%% Chapter 6, Problem #13

n = 100;
dp = linspace(1, 1, n);
for i = 3:n
    dp(i) = dp(i - 1) + dp(i - 2);
end
res = 0;
for i = 1:n
    res = res + 1 / dp(i);
end
disp(res);

%% Chapter 6, Problem #15

format long;
n = input('Enter the number of terms for pi: ');
a = sqrt(2);
product = a / 2;
for i = 2:n
    a = sqrt(2 + a);
    product = product * (a /2);
end
estimate = 2 / product
disp(abs(pi - estimate));

%% Chpater 6, Problem #19

for i = 100:999
    currNum = i; digitSum = 0; digitProduct = 1;
    while currNum > 0
        digitProduct = digitProduct * mod(currNum, 10);
        digitSum = digitSum + mod(currNum, 10);
        currNum = floor(currNum / 10);
    end
    if digitProduct == 6 * digitSum
        disp(i);
    end
end

%% Chapter 6, Problem #25

format long;
a = input('Input the value of a: ');
x = input('Input the value of x: ');
Sn = 0; Sn1 = 0; n = 0; E = 1;
while E >= 0.000001
    Sn = Sn + ((log(a))^n / factorial(n)) * x^n;
    E = abs((Sn - Sn1) / Sn1);
    Sn1 = Sn;
    n = n + 1;
end
disp(Sn);

%% Chapter 6, Problem #32

format long;
% Setting P = 800, 59071 or -31.55 would also work here
P = input('Input a number to calculate its cubic root: ');
xi = P; E = 1;
while E >= 0.00001
    xi1 = xi * (xi^3 + 2 * P) / (2 * xi^3 + P);
    E = abs((xi1 - xi) / xi);
    xi = xi1;
end
disp(xi1);

%% Chapter 6, Problem #36

a = input('Input values of a3, a2, a1, and a0 in order as a vector: ');
a3 = a(1); a2 = a(2); a1 = a(3); a0 = a(4);
A = a2 / a3; B = a1 / a3; C = a0 / a3;
Q = (3 * B - A^2) / 9; R = (9 * A * B - 27 * C - 2 * A^3) / 54;
D = Q^3 + R^2;
if abs(D) < 1e-10 % Some number very close to 0
    D = 0;
end
if D > 0
    disp('The equation has complex roots');
elseif D == 0
    x1 = 2 * R^(1/3) - A / 3
    x2 = -R^(1/3) - A / 3
    x3 = -R^(1/3) - A / 3
else
    theta = acos(R / sqrt(-Q^3));
    x1 = 2 * sqrt(-Q) * cos(theta / 3)
    x2 = 2 * sqrt(-Q) * cos(theta / 3 + deg2rad(120))
    x3 = 2 * sqrt(-Q) * cos(theta / 3 + deg2rad(240))
end

%% Chapter 6, Problem #37

format bank;
hws = input('Homework assignment grades: ');
midterms = input('Midterm grades: ');
final = input('Final exam: ');
hws = sort(hws, 'descend'); % in ascending order
top8 = hws(1:8);
hwAvg = mean(top8) / 80 * 100;
midAvg = mean(midterms);
if final >= midAvg
    midWeight = 0.30;
    finalWeight = 0.50;
else
    midWeight = 0.40;
    finalWeight = 0.40;
end
grade = 0.2 * hwAvg + midAvg * midWeight + final * finalWeight

%% Chapter 6, Problem #39

t = 0:0.5:10; y = sin(t) - 0.1 + rand(1, length(t));
ySmooth = y;
for n = 1:10 % Total of 10 passes
    for i = 2:length(ySmooth) - 1
        ySmooth(i) = (ySmooth(i - 1) + ySmooth(i) + ySmooth(i + 1)) / 3;
    end
end
plot(t, y)
hold on;
plot(t, ySmooth, 'b-');
grid on;
hold off;
xlabel('t');
ylabel('y(t)');
