%% Math 320 - Chapter 2 Homework
% Tomas Oh

close all, clear, clc, format compact

%% Chapter 2, Problem #1

[9, 1, 3^2, 7/4, 0, 2.25*8.5, 0.8, sin(pi/8)]

%% Chapter 2, Problem #6

c = 4.5; d = 2.8;
f = [d^2; c; c + d; c^d; d]

%% Chapter 2, Problem #7

g = [3:4:27]

%% Chapter 2, Problem #8

h = linspace(68, 12, 8)

%% Chapter 2, Problem #12

Fours = linspace(4, 4, 9)

%% Chapter 2, Problem #16

R = [-4:3:8  14:4:30]

%% Chapter 2, Problem #19

A = 4:3:13; B = (14:-2:6)';

% Part (a)
C = [B' A]

% Part (b)
D = [A';B]

%% Chapter 2, Problem #21

vC = 2:3:38;

% Part (a)
vCodd = vC(1:2:end)

% Part (b)
vCeven = vC(2:2:end)

%% Chapter 2, Problem #24

A = [1:7; 7:-1:1 ; linspace(2, 9, 7)]

%% Chapter 2, Problem #36

u = [0 9 -5 6 3 -1 2]; w = [-2 3 7 -4 0 1 5];

% Part (a)
A = [u(2:5); w([7 5]) u([6 7])]

% Part (b)
B = [w(4:7)', zeros(4,2), u([1 3 5 7])']

%% Chapter 2, Problem #37

M = reshape(1:2:29, 3, 5)

% Part (a)
Va = M(3, :)

% Part (b)
Vb = M(:, 4)

% Part (c)
Vc = [M(2, :) M(:, 3)']

%% Chapter 2, Problem #43

V = [1:2:11;13:2:23]
V(:,4:6) = V(:,1:3)
V(3:4,:) = V
V(:,[2:3 5:6]) = []

%% Chapter 2, Problem #44

% Part (a)
pA = [eye(3) eye(3)]

% Part (b)
pB = [zeros(2,3) ones(2)]

% Part (c)
pC = [ones(3,1) zeros(3,2) eye(3,1)]
