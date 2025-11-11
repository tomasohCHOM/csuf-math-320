%% Chapter 7 Review

%% Creating a Function File

%{
Functions accept inputs and produce outputs:
- first word of the file should be `function`
- the file must be the same name as the function
- the last word of a function file is `end` (optional)

Functions should be saved in the current folder to execute them later.
%}

%% Structure of a Function File

%{
function [output_arguments] = function_name(input_arguments)
- the function_name must be unique (cannot be a built-in function)
- input_arguments can be scalars, vectors, or matrices
- output_arguments consist of 0 or several values.
    - If no output arguments, the format is function name(input) instead
    - The code in the function must assign values to all outputs

Function bodies can use all the MATLAB programming features from before.
All variables in a function file are local. MATLAB uses separate memory
from the workspace when a function file is executed.
%}

%% Using a User-Defined Function

%{
function [month, total] = loan(amount, rate, years) % defined function file

r = 7.5; a = 2000; t = 4;
[x, y] = loan(a, r, t) % usage
%}

%% Anonymous Functions

%{
One-line user-defined functions that do not require a separate file.
- name = @(arglist) expr

Example:
    cool = @(x, y) x + y^2 + 5;
    a = cool(2, 3);

Anonymous functions can also use predefined variables, but MATLAB captures
the values of the predefined variables (not dynamic).
%}

%% Function Functions

%{
A function function is a accepts another function as input.
- Built-in function functions: fplot, quad, fzero

Function handles are used for passing functions to function functions
- @cos is the function handle for cos(x)

Passing functions to function functions:

1. Passing a built-in function:

>> fplot(@cos, [0, 2 * pi]);

2. Passing a user-defined function:

function y = cool(x) % cool.m
    y = x.^2 + 1;
end

>> fplot(@cool, [0, 5])

3. Passing an anonymous function:

>> f = @(x) x.^3 - 2;
>> fplot(f, [-1, 1]);
%}

%% Subfunctions

%{
Function files can have multiple functions, with the top-most one being the
primary function (the only one that can be used outside of this file):
- Every function in the file can call any other function within the file
- Each of these functions have their own workspace

function [out_1] = primaryFun(inputs)
    ...
end

function [out_2] = subFun1(inputs1)
    ...
end

function [out_3] = subFun2(inputs2)
    ...
end
%}
