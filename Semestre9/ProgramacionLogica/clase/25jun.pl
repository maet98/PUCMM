len([],0).
len([_|L],N):- len(L,X), N is X+1.
