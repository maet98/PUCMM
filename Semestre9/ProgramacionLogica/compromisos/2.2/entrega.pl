% 3.4

greater_than(succ(_),0).

greater_than(succ(X),succ(Y)) :- greater_than(X,Y).

%3.5
swap(leaf(X),leaf(X)).

swap(tree(X,Y), tree(Sx,Sy)) :- swap(X,Sy), swap(Y,Sx).
