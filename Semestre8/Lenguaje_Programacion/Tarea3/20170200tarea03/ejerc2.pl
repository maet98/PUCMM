pitagoricTriple(X,Y,Z) :- A is Z * Z - X * X - Y * Y, A = 0.

to100pitagoricTriple(X, Y, Z) :-
	between(1, 100, X),
	between(1, 100, Y),
	X =< Y,
	between(1, 100, Z),
	Y =< Z,
	pitagoricTriple(X, Y, Z).

/**
	El programa seria eficiente en el calculo de esto ya que se basa en comprabaciones de si la combinacion de numero generadas es o no una tripleta pitragorica,
	pienso que habria mejores manera de implementarlo para realizar reduciendo la aparicion de los numeros de X que son mayores a Y en en ciertos momentos causando 
	que desde el primer momento que se encuentre que X > a y se proceda a aumentar Y. 
*/
