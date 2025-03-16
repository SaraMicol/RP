%example with less than 5 disks
num_disks(3).
#program always.
pole(a;b;c).
#program initial.
h(on(3),pole(a)).
h(on(1),2).
h(on(2),3).


%goals
g(2,3).
g(1,2).
g(3,pole(c)).
g(2,pole(c)).
g(1,pole(c)).

