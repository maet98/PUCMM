directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz). 

travelFromTo(X,Y) :- directTrain(X,Y).

travelFromTo(X,Y) :- directTrain(X,Z), travelFromTo(Z,Y).

/*
En este ejercicio lo que se busca es saber si dos ciudades estan conectadas por un tren o una secuencia de estos.
En el cual pense representarlo como si fuera un grafo y se quiere buscar si dos nodos estan conectados.
En este caso el grafo es dirigido y lo resolvi con un dfs, donde el caso base si estan conectado directamente.
Entonces para continuar con la recursion se va por cada tren que este conectado con la ciudad X (directTrain(X,Z)) y
luego se continua la recursion con travelFromTo(Z,Y) hasta que se logre llegar a Y(true) o no halla mas donde explorar (false).
*/
