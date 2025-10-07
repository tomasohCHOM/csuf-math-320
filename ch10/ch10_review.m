%% Chapter 10 Review

%% The plot3() Command

%{
Basic 3-D plots can be created with the plot3():
- plot3(x, y, z, 'line specifiers', 'PropertyName', 'property value');
    - x, y, z are vectors of the point coordinates (must have same length).
    - Line specifiers and properties are the same as in 2-D plots.
%}

x = [1, 2, 3]; y = [4, 5, 6]; z = [7, 8, 9];
plot3(x, y, z, '-ok', 'MarkerSize', 10);
grid on;
axis([0, 4, 3, 7, 6, 10]);
xlabel('x'); ylabel('y'); zlabel('z');

%% Mesh & Surface Plots

%{
Mesh and surface plots are used to graph functions in the form z = f(x, y):
- x and y are independent, while z is dependent.
- A mesh connects the values of z with lines to form the surface outline.
- A surface connects lines in a mesh plot with planes to show a solid
  representation of the surface.

Creating a Mesh/Surface Plot:
1. Create a grid in the xy-plane with points of interest:
    - [X, Y] = meshgrid(x, y)
    - x and y are vectors defining the domain of x & y (with spacing)
    - X is the matrix of the x-coordinates (identical rows)
    - Y is the matrix of the y-coordinates (identical columns)
    - The resulting matrices are of same size.
2. Calculate the value of z at every point in the grid, with
   element-by-element operations using the X and Y matrices.
    - Z = X.^2 + Y.^2;
3. Make a mesh or surface using:
    - mesh(X, Y, Z) or surf(X, Y, Z)
%}

x = -1:0.1:3;
y = 1:0.1:4;
[X, Y] = meshgrid(x, y);
Z = (X .* Y.^2) ./ (X.^2 + Y.^2);
mesh(X, Y, Z);
surf(X, Y, Z);

%{
Additional Stuff with Mesh & Surf:
- You can change the color of the plot to be constant by using the Figure
  Window editor or the colormap() command:
    - colormap(C), where C is a vector in the form [r, g, b] (each element
      is a number between 0 and 1.
- grid on / grid off & box on work with mesh() and surf().
%}

%% Plots with Special Graphs

%{
MATLAB built-in special graphs: sphere, cylinder, bar, stem, pie, polar.

Polar Coordinates Grid:
1. Create a grid of values of theta and r with meshgrid
2. Calculate the value of z at each point of the grid
3. Use pol2cart(TH, R) to get X and Y Cartesian coordinates
4. Make a 3-D plot using X, Y, and Z and mesh()/surf()
%}

th = 0:0.1:2*pi; r = 0:0.1:2;
[TH, R] = meshgrid(th, r);
Z = R .* TH;
[X, Y] = pol2cart(TH, R);
mesh(X, Y, Z);
surf(X, Y, Z);

%% The view() Command

%{
The view command controls the direction from where you view the plot:
- view(az, el) or view([az el]);
- az: measured from the negative y-axis, positive counterclockwise
- el: the angle from the xy-plane. Positive towards z-axis.
- view([x, y, z]) (coordinates of a point, directed towards the origin).
%}