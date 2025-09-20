%% Chapter 1 Review

%% MATLAB Basics

%{
Command Window - used to:
- Execute commands
- Open other windows
- Run programs written by the user
- Manage the MATLAB software

Notes about using the Command Window:
- If command too long, can use ... then Enter
- Semicolon (;) suppresses the output
- Percent sign (%) treated as comments
- clc clears the command window display
%}

%% Arithmetic Operations with Scalars

%{
+, -, *, /, \, ^ are all supported (follows PEMDAS)
%}

%% Display Formats

%{
format short -      4 digits after decimal point
format long -       15 digits after decimal point
format short e -    Scientific notation with 4 digits after decimal
format long e -     Scientific notation with 15 digits after decimal
format short g -    Fixed or scientifc, whichever more compact (5 dig)
format long g -     Fixed or scientifc, whichever more compact (15 dig)
format bank -       2 digits after decimal
format rational -   Ratio of small integers
format compact -    Suppresses excess blank lines for more screen output
format loose -      Adds more blank lines in output
format default -    Back to defaults (format short, format loose)
%}

%% Elementary Math Built-in Functions

%{
Some MATLAB built-in functions:
- sqrt(x), nthroot(x, n), exp(x), abs(x), log(x), log10(x), factorial(x)
- pi for 𝜋
%}

%{
Trigonometric Math functions:
- sin(x), cos(x), tan(x), cot(x), asin(x), ...
- Note: put at d at the end of the trigonometric function for degrees
    - sind(x), cosd(x), ...
%}

%% Rounding Functions

%{
- round(x) or round(x, n) for n digits
- fix(x) towards 0, ceil(x) towards inf, floor(x) towards -inf
- rem(x, y) returns the remainder of x/y
- sign(x) returns 1 if positive, 0 if 0, -1 if negative
%}

%% Defining Scalar Variables

%{
my_var = numeric value or computable expression
Rules:
- Must begin with a letter, up to 63 characters long, case-sensitive
- Can contain letters, digits, and underscore
- Can't be the name of a built-in function or keyword
%}

%{
Commands for Managing Variables:
- clear (removes variables from memory) or clear x y (clears x y)
- who (displays list of variables in memory)
- whos (displays list of variables in memory with size info.)
%}
