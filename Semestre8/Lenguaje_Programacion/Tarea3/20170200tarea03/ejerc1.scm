#|
Ejercicio 1
El siguiente código C define la función power para calcular la potencia entera de un flotante.
1 double power(double a, int b) {
2     double temp = 1.0;
3     for (int i = 1; i <= b; i++)
4         temp *= a;
5     return temp;
6 }
El algoritmo de cálculo es iterativo debido, entre otras cosas, a la naturaleza imperativa del lenguaje C.
|#

#|1) Reescriba este procedimiento empleando algún lenguaje funcional.|#

(define power
  (lambda (base exp)
    (do ((temp exp (- temp 1))
      (val 1 (* val base)))
      ((> 1 temp) val)
    )
  )
)

#|2) Conciba y exprese en un lenguaje funcional un procedimiento diferente que sea preferible en algún sentido. Explique por qué considera preferible su versión alternativa.|#

(define power
  (lambda (base exp)
    (if (= exp 0)
    	1
      	(* base (power base (- exp 1) ) )
    )
  )  
)

#|
El paradigma funcional resalta por la utilización de la recursividad para la resolución de ciclos y la utilización de iteraciones en un paradigma funcional es costosa 
(siendo lo inverso en el caso del paradigma imperativo) ya que fuerza al programa a tener cambio de valores en sus funciones, lo cual no es natural en este que se caracteriza 
por el hecho de que las funciones son inmutables y solamente devuelven otras funciones.
|#

