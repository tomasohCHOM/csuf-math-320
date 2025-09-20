%% Chapter 2 Review

%{
Array's are a MATLAB basic data structure:
- Scalars, vectors, and matrices are all arrays
- You do not need to specify the size of an array, MATLAB handles that
%}

%% 1-D Arrays (Vectors)

%{
Row vectors:
- my_vector = [n1, n2, n3] or my_vector = [n1 n2 n3]
- my_vector = [m:q:n] for constant spacing
    - m is the first number, n is last, q is the spacing
    - If q > 0, elements are increasing and m < n
    - If q < 0, elements are decreasing and m > n
    - If q is omitted, the spacing is 1
    - If can't obtain n, the last element (for positive n) is the last 
      number that does not exceed n
- my_vector = linspace(xi, xf, n)
    - xi is first, xf is last, n is number of elements
    - (default n is 100)
%}

%{
Column vectors:
- my_vector = [n1; n2; n3]
- my_vector = [n1 n2 n3]' (apostrophe is the transpose operation)
%}

%% 2-D Arrays (Matrices)

%{
- M = [row_vec1; row_vec2; ... ; row_vec3] (stacking)
    - All rows must have same number of columns, otherwise Error
- M = [col_vec1, col_vec2, ... , col_vec3] (appending)
    - All columns must have same number of rows, otherwise Error
%}

%{
Other ways to create matrices:
- zeros(m, n) or zeros(n)
- ones(m, n) or ones(n)
- eye(m, n) or eye(n)
%}

%{
- M' gives you the transpose of the matrix. (M')' = original matrix
%}

%% Array Addressing

%{
Addresses (or indices) start at 1:
- my_vec(index) or my_matrix(row_index, col_index)
- If using one number for matrix indices, it goes by columns
%}

MAT = [3 11 6 5; 4 7 10 2; 13 9 0 8];
disp(MAT(4)); disp(MAT(3,1));

%% Using Colons in Addressing Arrays

%{
If v is a vector:
- v(:) addresses everything, v(m:n) addresses from m to n

If A is a matrix:
- A(:) creates a column vector (column by column) of everything in A
- A(:, n) all elements in the nth column (in columns)
- A(m, :) all elements in the mth row (in rows)
- Can also use m:n to specify from m to n (both rows and columns)

Specifying elements to pick out:
- va([a b c:d]) addresses elements a, b, and c through d
- A([a b], [c:d e]) addresses elements in column c through d and e of rows
  a and b in A
%}

A = [1:2:11; 2:2:12; 3:3:18; 4:4:24; 5:5:30];
disp(A(:));
disp(A(:, 3));
disp(A(2, :));
disp(A(2:4,:));
disp(A(1:3, 2:4));

%% Adding/Deleting Elements to Existing Variables

%{
MATLAB expands arrays filling with 0s when assigning values to non-existing
indices. Adding values to end of variables is appending/concatenating.

Can delete elements by assigning to []
%}