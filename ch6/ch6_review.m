%% Chapter 6 Review

%% Relational and Logical Operators

%{
Relational operators compare two numbers, assigning 1 if true, 0 as false:
- Operators: <, >, <=, >=, ==, ~=
- Can be used to compare scalar to scalar, array to array, and scalar to
  array. These result in logical arrays (different from numerical arrays)
- Can mix relational and arithmetic expressions (arithmetic first,
  relational go left to right)
- When addressing another vector, it extracts from that vector the elements
  in the positions where the logical vector has a 1
%}

disp(5 > 8);
disp((6 < 10) + (7 > 8) + (5 * 3 == 60 / 4));
r=[8, 12, 9, 4, 23, 19, 10];
disp(r(r <= 10));

%{
Logical (Boolean) operators combine T/F statements:
- A & B, A | B, xor(A, B), ~A, ~B
- Zero is false (0) and any non-negative number is true (1).
- AND/OR can compare two scalars, two arrays, or one of each
- NOT only has one operand (can be a scalar or an array)
%}

%{
Order of Precedence:
- parentheses, exponentiation, logical not, multiplication/division,
  addition/subtraction, relational operators, logical AND, logical OR
%}

disp(25 * ((12 & 0) + (~0) + (0 | 5)));
x = [9, 3, 0, 11, 0, 15]; y = [2, 0, 13, -11, 0, 4];
disp(x & y);
disp(~(x + y));

%{
Built-In Logical Functions:
- and(A, B), or(A, B), not(A), xor(A, B), all(A), any(A), find(A > d)
- all(A) returns 1 if all elements in the vector is true, 0 otherwise. If A
  is a matrix, then it returns a vector of the rows (0 or 1)
- any(A) is similar to all(A), but only checks if any value is true
- find(A) returns the indices of the non-zero elements. Can combine any
  relational operators as arguments
%}

%% Conditional Statements

%{
MATLAB conditional statements: if-end, if-else-end, if-elseif-else-end.
Structure:

if condition
    ...
elseif
    ...
else
    ...
end
%}

x = 5;

if x < 0
    disp('x is negative');
elseif x == 0
    disp('x is zero');
else
    disp('x is positive');
end

%% Switch Statements

%{
Structure of a switch statement in MATLAB:

switch switch_expression
    case value1
        ...
    case value2
        ...
    otherwise
        ...
end
%}

day = 'Monday';
switch day
    case 'Monday'
        disp('Start of the week');
    case 'Friday'
        disp('Almost weekend!');
    case {'Saturday', 'Sunday'}
        disp('Weekend!');
    otherwise
        disp('Midweek day');
end

%% Loops

%{
For-loop structure:

for k = f:s:t (first index, increment step, and terminal index)
    ...
end

While-loop structure:

while condition
    ...
end
%}

for i = 1:5
    disp(['Number: ' num2str(i)]);
end

x = 1;

while x <= 5
    disp(['Count: ' num2str(x)]);
    x = x + 1;
end

%% Nested Loops and Nested Conditional Statements

%{
Can have one or more loops inside of a loop, same with conditions. They all
must be met with the same number of end statements.
%}

for i = 1:3
    for j = 1:2
        disp(['i = ' num2str(i) ', j = ' num2str(j)]);
    end
end

%% The break and continue commands

%{
The break command terminates the execution of the current loop
The continue command goes directly to the next iteration of the loop
%}