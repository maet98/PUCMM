member1(List,X):- append(_,[X|_],List).

accSet([],Out,Out).

accSet([H|Tail],Acc,Out):-
    member(H,Acc),
    accSet(Tail,Acc,Out).

accSet([H|Tail],Acc,Out):-
    not(member(H,Acc)),
    accSet(Tail,[H|Acc],Out).

set(Input,Output):-
    accSet(Input,[],Output).
