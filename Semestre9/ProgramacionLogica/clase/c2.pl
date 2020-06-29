add(X,0,X).

add(X,succ(Y),succ(Z)) :- add(X,Y,Z).
