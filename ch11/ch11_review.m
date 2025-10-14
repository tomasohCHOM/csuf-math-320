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
- 
%}