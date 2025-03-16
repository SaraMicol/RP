% Propagate the value of size(N) to n
n(N) :- dim(N).

% Explicitly associate the value of N to a range
row(I) :- n(N), I = 0..N-1.
column(J) :- n(N), J = 0..N-1.

% Define adjacency in all directions
adj(R, C, R1, C1) :- row(R), column(C), row(R1), column(C1),
    |R - R1| + |C - C1| = 1.
% Define diagonal adjacency
adj_diagonal(R, C, R1, C1) :- row(R), column(C), row(R1), column(C1),
    |R - R1| = 1, |C - C1| = 1.

% Generate possible tent positions
{ tent(R,C) } :- row(R), column(C).

% Generate assignments between trees and tents
{ assigned(TR,TC,R,C) } :- tree(TR,TC), tent(R,C), adj(TR,TC,R,C).

% Each tree must have exactly one assigned tent
1 { assigned(TR,TC,R,C) : tent(R,C), adj(TR,TC,R,C) } 1 :- tree(TR,TC).

% Each tent must be assigned to exactly one tree
1 { assigned(TR,TC,R,C) : tree(TR,TC), adj(TR,TC,R,C) } 1 :- tent(R,C).
   
% Restriction: do not allow two tents to be in adjacent cells
:- tent(R, C), tent(R1, C1), adj(R, C, R1, C1).
% Restriction: do not allow two tents to be diagonally adjacent
:- tent(R, C), tent(R1, C1), adj_diagonal(R, C, R1, C1).
% Restriction to not place a tent on a tree's position
:- tent(R, C), tree(R, C).
% Restrictions to ensure the number of tents in each row does not exceed the given limit
:- row_constraint(R, N), N != #count { C : tent(R, C) }.
% Restrictions to ensure the number of tents in each column does not exceed the given limit
:- column_constraint(C, N), N != #count { R : tent(R, C) }.

#show tent/2.

