% rev/2
accRev([H|T],A,R):-  accRev(T,[H|A],R).
accRev([],A,A).
rev(L,R):- accRev(L,[],R).

% append/3
append([],L,L).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3).

% 6.2
palindrome(List) :- rev(List,List).

/*
Testcases Positivos.
palindrome([a,d,a]).
palindrome([1,2,3,4,5,4,3,2,1]).
palindrome([a,n,n,a]).

Testcases Negativos.
palindrome([1,2,3,2,3]).
palindrome([m,i,g,u,e,l]).
palindrome([s,a,l,i,d,a]).
*/

% 6.3
toptail([_|Tail],Output):- rev(Tail,[_|RevTail]),rev(RevTail,Output).

/*
Testcases Positivos
toptail([a,b,c,d,e,f],[b,c,d,e]).
toptail([a,b,c,d,e,f],[b,c,d,e]).
toptail([a,b,c,d,e,f],[b,c,d,e]).

Testcases Negativos
toptail([a,b,c,d,e],[b,c).
toptail([d,s,e,r,c],[d,s,e,r]).
toptail([4],[1,2,3]).
*/

% 6.4
last(List,Ans):- rev(List,[Ans|_]).

last2([Ans|[]],Ans).
last2([_|T],Ans):- last2(T,Ans).

/*
Testcases Positivos
last([a,d,s,e,s],s).
last([3,4,5,3,2],X).
last([a,d,v,d,s,d],d).

Testcases Negativos
last2([],X).
last2([1,4,2,3,4,5],3).
last2([a,d,v,e,j,5,r],k).
*/

% 6.5

swapfl([Fist1|Tail1],List2):- rev(Tail1,[Last1|RevMiddle]),
                              rev(RevMiddle,Middle),
                              append([Last1],Middle,Temp),
                              append(Temp,[Fist1],List2).
/*
Testcases Positivos
swapfl([4,2,3,4],X).
swapfl([4,5,2,3,12],[12,5,2,3,4]).
swapfl([6,4,3,2,1,3],[3,4,3,2,1,3]).

Testcases Negativos
swapfl([1,2,3],[2,2,2]).
swapfl([1,2,2,3],[3,2,2,2]).
swapfl([1,3,4,5,2],[1,2,3,4,9]).
*/

% 6.6

% prefix(P,L) :- append(P,_,L).
suffix(S,L) :- append(_,S,L).
sublist(SubL,L) :- suffix(S,L), prefix(SubL,S).

zebra(ZebraOwner) :-
    Street = [_, _, _],
    member(house(red,english, _), Street),
    member(house(_, spanish, jaguar), Street),
    member(house(_, ZebraOwner, zebra), Street),
    sublist([house(_, _, snail), house(_, japanese, _)], Street),
    sublist([house(blue, _, _),house(_, _, snail)], Street).
