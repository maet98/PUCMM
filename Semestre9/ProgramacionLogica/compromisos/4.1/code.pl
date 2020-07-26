% 10.2
unifiable([],_,[]).
unifiable([H|T],Term,List3):- \+ H = Term,unifiable(T,Term,List3).
unifiable([H|T],Term,[H|T2]):- \+ \+ H = Term,unifiable(T,Term,T2).

unifiable2([],_,[]).
unifiable2([H|T],Term,List3):- \+ H = Term,!,unifiable(T,Term,List3).
unifiable2([H|T],Term,[H|T2]):- \+ \+ H = Term,unifiable(T,Term,T2).

unifiable3([],_,[]).
unifiable3([H|T],Term,List3):- \+ H = Term,!,unifiable(T,Term,List3).
unifiable3([H|T],Term,[H|T2]):- unifiable(T,Term,T2).

%Split

class(Num,X):- Num < 0, X = negativo.
class(0,positivo).
class(Num,X):- Num > 0, X = positivo.

split([],[],[]).
split([H|T],[H|T2],List3):- class(H,positivo),split(T,T2,List3).
split([H|T],List2,[H|T3]):- class(H,negativo),split(T,List2,T3).

%10.4
directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz). 

directTrain(dudweiler,saarbruecken).
directTrain(saarbruecken,forbach).
directTrain(forbach,freyming).
directTrain(freyming,stAvold).
directTrain(stAvold,fahlquemont).
directTrain(fahlquemont,metz).
directTrain(metz,nancy). 

route(Source, Dest,[Source,Dest],_):- directTrain(Source,Dest), !.

route(Source,Dest,[Source|Route],Vis):-
    directTrain(Source,Z),
    \+ member(Z,Vis),
    route(Z,Dest,Route,[Source|Vis]).

route(Source,Dest,Route):- route(Source,Dest,Route,[]).

%10.5
loves(vicent,mia).
loves(marsellus,mia).
jealous(X,Y):- loves(X,Z), loves(Y,Z), \+ X = Y.
