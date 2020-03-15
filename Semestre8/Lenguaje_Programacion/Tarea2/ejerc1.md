### Ejercicio 1 (3 puntos)

Encuentre
$$
wp( a:= 2;\ b:=a +1;\ a:=b*b, a=9)
$$
donde _wp_ tiene el significado explicado en el texto y la clase sobre semántica formal.

Argumente su respuesta.

wp(a := 2, wp( b := a+1, wp( a := b*b, a = 9)))

* 9 = $b^2 \rightarrow b = 3$
* $wp(a: b*b, a = 9)\rightarrow b = 3$

wp( a := 2, wp( b := a + 1, b = 3))

* $3 = a + 1 \rightarrow a = 2$
* $Wp( b := a +1, b = 3) \rightarrow a = 2$

wp( a:= 2, a = 2)

* 2 = 2

Dado que la respuesta seria la misma expresión de asignación, por el hecho de que una asignación solo requiere como precondicion para obtener un resultado es que el numero asignado sea el mismo que el solicitado en la condición, en este caso convirtiendo el resultado en una tautologia porque en el contexto matemático, se preserva la condicion dos siempre sera igual a 2.
