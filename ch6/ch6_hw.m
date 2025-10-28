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
Sn = 0; Sn1 = 0; n = 0;
while 1
    Sn = Sn + ((log(a))^n / factorial(n)) * x^n;
    E = abs((Sn - Sn1) / Sn1);
    if E < 0.000001
        break
    end
    Sn1 = Sn;
    n = n + 1;
end
disp(Sn);

%% Chapter 6, Problem #32

format long;
P = input('Input a number to calculate its cubic root: ');
xi = P;
while 1
    xi1 = xi * (xi^3 + 2 * P) / (2 * xi^3 + P);
    E = abs((xi1 - xi) / xi);
    if E < 0.00001
        break
    end
    xi = xi1;
end
disp(xi1);

%% Chapter 6, Problem #36



%% Chapter 6, Problem #37



%% Chapter 6, Problem #39


