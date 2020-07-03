
listaSum([],[]).
listaSum([Head1|Tail1],[Head2|Tail2]):- Head2 is Head1 + 1, listaSum(Tail1,Tail2).
/*
Testcase Positivos:
listaSum([1,2,3,4],[2,3,4,5]).
listaSum([1,2,3,4],[2,3,4,5]).
listaSum([1,2,3,4],[2,3,4,5]).

Testcase Negativos:
listaSum([3,2,4],[12,3,4,]).
listaSum([1,2,3,4],[4,5,2,3]).
listaSum([2,4,2,3],[3,5,4,4]).
*/

listaMapSum([],0).
listaMapSum([H|T],Ans):-  listaMapSum(T,Sum), Ans is Sum + H.

/*
Testcase Positivos:
listaMapSum([43,2,1,2,12],Sum).
listaMapSum([2,4,3,2],11).
listaMapSum([34,2,3,1,1,1],42).

Testcase Negativos:
listaMapSum([4,3,5],15).
listaMapSum([5,5,5,5,25],24).
listaMapSum([65,42,3,43],54).
*/

listaSum([],_,[]).
listaSum([Head1|Tail1],Sum,[Head2|Tail2]):- Head2 is Head1 + Sum,listaSum(Tail1,Sum,Tail2).

/*
Testcase Positivos:
listaSum([4,2,4,5],9,[13,11,13,14]).
listaSum([13,5,6,3,2,1],-10,[3, -5, -4, -7, -8, -9]).
listaSum([12,3,4],13,[25,16,17]).

Testcase Negativos:
listaSum([1,2,1,5],10,[9,12,11,15]).
listaSum([4,2,3,1],Y,[1,2,3,4]).
listaSum([3,3,3,3],1,[4,3,2,4]).
*/
