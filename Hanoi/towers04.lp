%example with 4 disks and 5 poles
num_disks(4).
#program always.
pole(a;b;c;d;e).

#program initial.
h(on(4),pole(a)).
h(on(1),2).
h(on(2),3).
h(on(3),4).

%goals
g(3,4).
g(2,3).
g(1,2).
g(4,pole(c)).
g(3,pole(c)).
g(2,pole(c)).
g(1,pole(c)).

