%% Chapter 11 Review

%% Symbolic Object and Symbolic Expressions

%{
Symbolic object: made of variables and numbers that MATLAB evaluates
symbolically.
Symbolic expression: a mathematical expression with 1+ symbolic objects.

Creating symbolic objects:
- syms object1 object2 object3.
- Can be one or more letters (no spaces), with digits after the 1st letter
- object_name = sym(n); where n is a scalar, vector, or array to define
  symbolically

Creating symbolic expressions:
- A math expression becomes a symbolic expression if symbolic variables
- MATLAB simplifies those expressions exactly.
- double(S) - converts a symbolic object/expression to numberical form.

symvar(S), symvar(S, n):
- symvar(S): returns the symbolic variables in expression S
- symvar(S, n): returns the first n variables (alphabetically)
%}

syms a b x y z
S = a*x^2 + b*y + z^3;
disp(symvar(S));       % returns [a b x y z]
disp(symvar(S, 3));    % returns [a b x]

S = x^2 + y + 5;
disp(symvar(S));       % returns [x y]

S = 25;
disp(symvar(S));       % returns []

%% Changing the Form of an Existing Symbolic Expression

%{
collect(S) or collect(S, var): groups terms with the same power of var.
expand(S): expands products, trig identities, exponentials, and logs.
factor(S): factors a polynomial expression into lower-degree polynomials.
simplify(S): applies algebraic and trigonometric identities to reduce size.
pretty(S): displays the expression in readable mathematical form.
%}

syms x y
S = (x + y)^2 * (x - y);
disp(collect(S, x));
disp(expand(S));
disp(factor(expand(S)));
disp(simplify(expand(S)));
pretty(S)


%% Solving Algebraic Equations

%{
solve(eq == n) or solve(eq == n, var): solves equations symbolically.
- If eq has ONE symbolic variable, MATLAB assumes you want numeric roots.
- If MULTIPLE symbolic variables, returns one variable in terms of others.
- If no '==' is present
    - MATLAB assumes eq == 0 (so solve(x^2 - 4) means solve(x^2 - 4 == 0)).

Multiple roots:
- Returned as a column vector.
- Use double() to convert exact symbolic roots into floating-point numbers.

Systems of equations:
- solve(e1, e2, ..., en) or [x, y, z] = solve(e1, e2, e3)
- If number of equations = number of unknowns → numeric/specific solution.
- If fewer equations → symbolic result in terms of parameters.
%}

syms x y z a b c
S = 2*x - 1;
disp(solve(S));

disp(solve(exp(2*x) - 5));

T = a*x - y;
Yans = solve(T, y);
Aans = solve(T, a);
Xans = solve(T, x);

xAns1 = solve(x + 7 == 23);
xAns2 = solve(x^2 + x + 7);
disp(double(xAns2));

% Solving systems
E1 = x + 2*y - z - 4;
E2 = 2*x + y + z + 2;
E3 = x + 2*y + z - 2;
[xs, ys, zs] = solve(E1, E2, E3);
disp([xs ys zs]);

% Structure output form (useful for larger systems)
E1 = x + 2*y - z == 4;
E2 = 2*x + y + z == -2;
E3 = x + 2*y + z == 2;
S = solve(E1, E2, E3);
disp([S.x S.y S.z]);


%% Differentiation

%{
diff(S): first derivative (default variable if only one symbolic variable)
diff(S, n): nth derivative
diff(S, var): derivative w.r.t. specified variable
diff(S, var, n): nth derivative w.r.t. specified variable
- MATLAB assumes differentiation w.r.t. the "first" symbolic variable.
- If you want a specific variable, always specify it (e.g., diff(expr, y)).
%}

syms x y t
y1 = exp(x^4);
yp = diff(y1);
ypp = diff(y1, 2);
disp(yp), disp(ypp);

f = 5*y^2*cos(3*t);
fprime = diff(f);      % default variable is y
fprimeT = diff(f, t);  % derivative w.r.t. t
disp(fprimeT);


%% Integration

%{
int(S): indefinite integral
int(S, var): indefinite integral w.r.t. var
int(S, a, b): definite integral from a to b
int(S, var, a, b): same as above, but explicitly defines variable
- MATLAB tries to find a symbolic antiderivative.
- For numeric approximations, use vpa(int(...)) or double(int(...)).
- Definite integrals with symbolic bounds return exact symbolic results.
%}

syms x y t
I1 = int(2*cos(x) - 6*x);
I2 = int(x*sin(x));
I3 = int(5*y^2*cos(4*t), y);
I4 = int(5*y^2*cos(4*t), t);
disp(I1), disp(I2), disp(I3), disp(I4);

% Definite integral example
S = sin(y) - 5*y^2;
a = 0; b = pi;
myAns = int(S, a, b);
disp(myAns);

myAns2 = int(sin(y) - 5*y^2, 0, pi);
disp(myAns2);

% Unresolved integral example
S = sin(sinh(x));
disp(int(S));


%% Symbolic Functions

%{
syms f(var1, ..., varn): defines symbolic function(s)
- diff(f): works like algebraic differentiation.
- int(f): finds symbolic antiderivative.
%}

syms f(x)
f(x) = x^2 + 7;
fp = diff(f);
disp(fp(3));

F = int(f);
disp(F(3));

syms f(x, y)
f(x, y) = x^2 + cos(y);
fpx = diff(f, x);
fpy = diff(f, y);
disp(fpy(0, 4));
f2px = diff(f, x, 2);
disp(f2px);


%% Solving ODEs with dsolve

%{
dsolve(eqn) or dsolve(eqn, cond)
- eqn: symbolic differential equation (use diff(y, t)).
- cond: initial/boundary conditions (e.g., y(0) == 1).

- Returns general symbolic solutions.
- To get constants named automatically (C1, C2, ...), omit conditions.
- You can access derivatives using diff(y, t, n).
%}

syms y(t) x(t) s(t) a
eqn1 = diff(y, t) == 4*t + 2*y;
sol1 = dsolve(eqn1);
disp(sol1);

eqn2 = diff(x, t, 2) + 2*diff(x, t) + x == 0;
sol2 = dsolve(eqn2);
disp(sol2);

Dy = diff(y, t);
eqn3 = diff(y, t, 2) - 2*Dy + 2*y == 0;
cond3 = [y(0) == 1, Dy(0) == 0];
pSol3 = dsolve(eqn3, cond3);
disp(pSol3);

eqn4 = diff(s, t) == a*x^2;
sol4 = dsolve(eqn4);
disp(sol4);


%% Plotting Symbolic Expressions

%{
ezplot(S): plots S vs its variable.
ezplot(S, [xmin xmax]): set x-range.
ezplot(S, [xmin xmax ymin ymax]): set both axis limits.
ezplot(S1, S2): parametric plots (S1=x(t), S2=y(t)).
h = ezplot(...): returns handle for further customization.
%}

syms x y t
yExpr = (3*x + 2)/(4*x - 1);
ezplot(yExpr);

z = 4*x^2 - 18*x + 4*y^2 + 12*y - 11;
ezplot(z, [-2 6 -6 3]);
title('New Title');
xlabel('hi'); ylabel('bye');

ezplot(x^2 == y^4, [-4 4 -4 4]);

xParam = cos(2*t);
yParam = sin(4*t);
ezplot(xParam, yParam);

xParam = t*sin(5*t);
yParam = t*cos(5*t);
ezplot(xParam, yParam);


%% Numeric Calculations with Symbolic Expressions

%{
subs(S, var, val): substitutes val into S for var.
subs(S, {v1, v2}, {n1, n2}): substitutes multiple variables.
R and val arrays must have the same size (unless one is scalar).
%}

syms x v a t g b c d
yExpr = 0.8*x^3 + 4*exp(0.5*x);
disp(subs(yExpr, x, 2));

Y = (v^2 * exp(a*t)) / g;
disp(subs(Y, t, 2:5));

S = a*x^d + b*x + c;
R = subs(S, {a, b, c, d}, {2, [2 4 6], 3, [1 3 5]});
disp(R);
