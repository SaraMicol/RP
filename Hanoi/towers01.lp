%simple example
num_disks(5).
#program always.
pole(a;b;c).
#program initial.
h(on(4),5).
h(on(5),pole(a)).
h(on(1),2).
h(on(2),3).
h(on(3),4).

%goals
g(5,pole(c)).
g(4,5).
g(3,4).
g(2,3).
g(1,2).
g(4,pole(c)).
g(3,pole(c)).
g(2,pole(c)).
g(1,pole(c)).

