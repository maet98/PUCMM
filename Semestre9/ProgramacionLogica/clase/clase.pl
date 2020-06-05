sobre(c, mesa).
sobre(b, c).
sobre(a, b).
sobre(e, mesa).
sobre(d, e).

bajo(X, Y):- sobre(Y,X).

encima(X,Y) :- sobre(X,Y).
encima(X,Y) :- sobre(X,Z),encima(Z,Y).

libre(X):- not(sobre(_,X)).
