#program always.
% Disk and pole definitions
disk(D) :- D = 1..N, num_disks(N).

% Helper predicates for pole positions
pole_of(D,P):- h(on(D),pole(P)).
pole_of(D1,P):- h(on(D1),D), pole_of(D,P).

% Top disk , it's the minimum with nothing on it
not_empty(D):- h(on(A),D).
top(P,D):- pole_of(D,P), not not_empty(D),
       #min{D2 : pole_of(D2,P), not not_empty(D2)} = D.

% Action definitions
action(move(P1,P2)):- pole(P1), pole(P2).

#program dynamic.
% Action choice
1 {o(A):action(A)} 1.

% Effect axioms 
h(on(D),pole(P2)):- o(move(P1,P2)), 'top(P1,D).

% Memorize which disk is the last moved'
last_moved(D) :- moved(D).

%Forbide to move the last moved disk in two consecutive steps
%:- o(move(P1,_)), 'top(P1,D), 'last_moved(D).

% Executability constraints'
:- o(move(P1,P2)), 'top(P1,D1), 'top(P2,D2), D1 > D2.

% Inertia
h(on(D),P):- 'h(on(D),P), not moved(D).
moved(D):- o(move(P1,_)), 'top(P1,D).

%optimization
:-o(move(P1,P2)),'top(P1,D1), D1>D, disk(D), _g(D1,P) , P2!=P.

%goals'
#program final.
:- _g(D,pole(P)), not h(on(D),pole(P)).


#show o/1.
#show pole_of/2.
#show top/2.

