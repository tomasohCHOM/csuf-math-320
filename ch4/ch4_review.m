%% Chapter 4 Review

%% Three Ways to Assign Variables

%{
1. Hard-coding values in script files (e.g. x = 30)
2. Defining & assigning a value in the command window
3. Using input() in the script, waiting input from the command window
    my_var = input('prompt: ')
    my_var = input('prompt: ', 's') for strings
%}

%% Output Commands

%{
disp(my_var) or disp('some string')
- Gets displayed in a new line
- Not much control over what it can display

The fprintf command:
- Double symbols for quotation marks, percent symbols, and backslashes
- Vectorized: if the variable is a vector or a matrix, the command repeats
  column-by-column
- \n (newline) and \t (tab)
- Defining formats of numbers: % (required), flag (optional), field width 
  and precision (optional), conversion character (required):
    - Flags: (-) aligns to the left, (+) adds a sign character, and 0 adds
             zeros if the number is shorter than the field
    - Field width and precision: #.# format (numbers)
    - Conversion character: e (exponential notation), f (fixed-point
                            notation), d/i (integer notation)
- You can break a fprintf command using [] and ... in between
%}

%% Save and Load Commands

%{
Saving variables stored in a workspace:
- save file_name or save('file_name') (all variables)
- save file_name var1 var2 or
  save('file_name', 'var1', 'var2') (specific variables)

Retrieving variables saved with the save command:
- load file_name or load('file_name') (all variables)
- load file_name var1 var2 or
  load('file_name', 'var1', 'var2') (specific variables)
%}

%% Importing & Exporting Data

%{
Can import from and export data to other programs like Excel:
- my_var = xlsread('filename','sheet_name','range');
- my_var = xlswrite('filename','sheet_name','range');
%}