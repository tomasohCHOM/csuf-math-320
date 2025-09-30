%% Chapter 5 Review

%% The plot() Command

%{
plot(x, y) with x and y being vectors with the same number of elements
- First vector = horizontal axis, second vector = vertical axis
- If plot(y), the figure shows a plot of the inputted values vs [1,2,3,...]
- Defaults: both axes are linear, lines connecting dots, and blue graph

Formatting the plot command:
- plot(x, y, 'line specifiers', 'PropertyName', 'PropertyValue')
- Line specifiers are optional and define line style and marker types.
  Typed as strings with specifiers in any order.
- Line styles:
    - (-) solid (default)
    - (--) dashed
    - (:) dotted
    - (-.) dash-dotted
- Line colors: r (red), g (green), b (blue), c (cyan), m (magenta), y
               (yellow), b (black), w (white)
- Marker types: + (plus), o (circle), * (asterisk), p (point), x (cross),
                ^ (triangle up), v (triangle down), s (square), d
                (diamond), < (triangle left), > (triangle right) p 
                (five-pointed star), h (six-pointed star)
- Properties: LineWidth, MarkerSize, MarkerEdgeColor, MarkerFaceColor
%}
x = -2:0.1:2; y = x .^ 2;
plot(x, y, ':mp', 'LineWidth', 2, 'markersize', 12, ...
    'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'c');

%% The fplot() Command

%{
fplot(function, [limits], 'line specifiers') (does not require vectors)
- function: must be typed in the form @(x) f(x)
    - using element-by-element operations
    - can use built-in MATLAB or user-defined functions (more in Ch. 7)
    - can be a function of any letter
- limits: specify the domains of x ([xmin, xmax])
- line specifiers: same as the plot() command
%}

fplot(@(x) x.^2, [-2 2], 'LineWidth', 2);

%% Plotting Multiple Graphs in Same Plot

%{
Using the plot() command:
- plot(x, y, u, v, t, h), each set of pairs can be of different size
- Can place line specifiers after each pairing

Using the hold on / hold off commands:
- Create the first graph with plot/fplot
- Type hold on
- Create the remaining plots
- Type hold off
%}

hold on
fplot(@(x) 9*x .^2 -26, [-2 4], '--b', 'LineWidth', 2);
x= -2:0.01:4;
y2p= 18 * x;
plot(x, y2p, '-.r', 'linewidth', 2)
hold off

%% Formatting a Plot

%{
- xlabel('x-axis text') - writes a label below the horizontal axis
- ylabel('y-axis text') - writes a label below the vertical axis
- title('Title text')   - writes a title above the plot
- text(x, y, 'text')    - places some text with first character at (x, y)
- legend('text1', 'text2', ..., 'Location', 'pos') -  writes a legend for
  each set in the plot; shows a sample of the line type for each graph this
  plotted. The default position is the upper right-hand corner. Options:
    - NE, NW, SE, SW, B (least interference), BO (least unused space
      outside the plot)
%}

x=[1 3 4 5 8]; y=[11 10 0 12 14];
plot(x, y, ':ro', 'linewidth', 1);
xlabel('Time(sec)');
ylabel('Distance(ft)');
title('Distance Traveled');
text(6,10,'Cool');
legend('Distance', 'Location', 'SE');

%{
Text modifiers - placed inside text string affecting text appearance:
- \bf (bold font), \it (italic) \rm (normal)
- \fontname{fontname}, \fontsize{fontsize}

Subscripts and Superscripts:
- Use _ and ^ symbols respectively. Several characters can be typed inside
  {} (e.g. 'e^{-4 * t}')

Greek characters: can be included by typing \letterName within strings.

Examples:

title('\it What You Should Never See');
title('What You Should{\it Never} See');
title('\fontname{Old English Text MT} My Name is Robin Hood');
title('{\fontname{Old English Text MT}Robin Hood} was here');
xlabel('H_2O');
ylabel('e^{-k*sin(x)}');
title('Standard deviation (\sigma) of resistance in M\Omega');
%}

%{
Formatting the Axes on a Plot:

axis command:
- axis([xmin, xmax, ymin, ymax]), axis equal, axis square, axis tight

grid command:
- grid on, grid off
%}
axis([-1 9 -4 18]);
grid on;

%% Plots with Logarithmic Axes

%{
semilogy(x, y)  - log10 scale for y and linear for x
semilogx(x, y)  - linear scale for y and log10 scale for x
loglog(x, y)    - both axes in log10 scale

Notes:
- Can use line specifiers and property names like the plot() command
- All data must be larger than 0 (otherwise, undefined)
%}

%% Plots with Error Bars and Special Graphics

%{
Other specialized plots, such as error bar, stairs, stem, pie, etc.
Pages 150 – 153 of the textbook for more information.
%}

%% Histograms

%{
histogram(X) where X is a vector of data/values
- Automatic binning algorithm, returns bins of uniform width over X range.
- Each bin is a vertical bar; left & right are ranges of the bin, the
  height is the number of data points in the bin

Other forms of the histogram command
- histogram(X, nbins)   - MATLAB divides the range into equally-sized bins
- histogram(X, edges)   - edges is a vector that specifies the endpoints of 
                          each bin
- h = histogram(___)    - Creates a histogram and assigns it to a variable.
                          Can then view/modify properties with h.property.


%}

x = rand(10000, 1);
histogram(x);

h = histogram(x);
disp(h.Values);
disp(h.BinEdges);
h.BinWidth = 1;
h.FaceColor = 'magenta';
h.EdgeColor = 'none';

%% Polar Plots

%{
polar(theta, radius, 'line specifiers'), where theta is a vector of angles
in radians, radius is a vector of the radius (same size), and the line
specifiers are the same as in the plot() command.
%}

th = linspace(0, 2 * pi, 200);
r = 3 * cos(0.5 * th).^2 + th;
polarplot(th, r, '-r');

%% Putting Multiple Plots on the Same Page

%{
subplot(m, n, p), where m is rows, n is columns, and p is the position
- Subplots are numbered left to right, top to bottom
- If it does not exist, MATLAB creates the figure, places it in position p,
  and leaves the rest blank.
%}

subplot(3, 1, 1);
th=linspace(0, 2*pi, 200);
r=3*cos(0.5 * th).^2 + th;
polarplot(th, r, '-r');
subplot(3, 1, 2);
plot([1 3 5], [11 10 16], '.-');
subplot(3, 1, 3);
fplot(@(x) sin(x), [0 2*pi],'m');

%% Multiple Figure Windows

%{
- figure or figure(n) creates a new figure window (or makes the nth window
  the active one if it already exists).
- close or close(n) or close(all) for closing figure windows.
%}

figure, figure, figure, figure(10);
figure(2), fplot(@(x) exp(-0.2 * x) .* cos(x), [0 10]);
