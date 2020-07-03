% 4.3
second(X, List):- [_|[X|_]] = List.

/*
Testcases

second(X,[1,23,4,5]).
second([3],[4,[3],4,23,a]).
second(n,[a,n,we,r,t,w]).

second(x,[3,4,2,]).
second(X,[2]).
second(1,[3,2,32]).
*/

% 4.4
swap12([X,X1|Res],[X1,X|Res]).

/*
Testcases

swap12([1,2,3],[2,1,3]).
swap12([5,4,3,2,1],X).
swap12([a,b],[b,a]).

swap12([b,a],[b,a,c]).
swap12([1,a,3,4,5],[1,a,3,4,5]).
swap12([123,4,12,3],[2,4,5,23,3]).
*/

% 4.5
tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([],[]).
listtran([H1|T1],[H2|T2]):- tran(H1,H2), listtran(T1,T2).

/*
Testcases

listtran(X,[one,two,four]).
listtran([eins,vier,sechs],[one,four,six]).
listtran([zwei,drei],[two,three]).

listtran([a,eins],[a,one]).
listtran([eins],[one,two).
listtran([eins, neun, sieben],[one,eight,six]).
*/

% 4.6
twice([],[]).
twice([H|T1],[H,H|T2]) :- twice(T1,T2).

/*
Testcases

twice([1,2,3],[1,1,2,2,3,3]).
twice([1],[1,1]).
twice(X,[a,a,c,c,a,a]).

twice(X,[a,c,c,a,a]).
twice([a],[a]).
twice([a,b,c],[a,a,b,c,c]).
*/
