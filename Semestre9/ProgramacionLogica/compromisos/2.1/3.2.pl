%Knowejj
directlyln(katarina,olga).
directlyln(olga,natasha).
directlyln(olga,irina).

%Caso base de la recursion
in(X,Y) :- directlyln(X,Y).

in(X,Y) :- directlyln(X,Z), in(Z,Y).

/*
Lo que se buscaba resolver era que la regla in(X,Y), lo cual significa que Y esta dentro de X.
Debido a esto lo que se realizo fue que dadto que se sabia quien esta directamente dentro de otro.
Se decidio realizar una recursion con un caso base de directlyln(X,Y) y la recursion directlyln(X,Z) 
para que la posible Z sean solos lo que cumplan con esta regla y luego in(Z,Y) para continuar la recursion.
Hasta que se llegue al objetivo o no se pueda buscar mas.
*/
