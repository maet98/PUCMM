swap(leaf(X),leaf(X)).

swap(tree(X,Y), tree(Sx,Sy)) :- swap(X,Sx), swap(Y,Sy).

