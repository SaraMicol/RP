%example with 6 disks
num_disks(6).
#program always.
pole(a;b;c).

#program initial.
h(on(5),6).
h(on(6),pole(a)).
h(on(4),5).
h(on(3),4).
h(on(2),3).
h(on(1),2).

%goals
g(6,pole(c)).
g(5,6).
g(4,5).
g(3,4).
g(2,3).
g(1,2).
g(5,pole(c)).
g(4,pole(c)).
g(3,pole(c)).
g(2,pole(c)).
g(1,pole(c)).
