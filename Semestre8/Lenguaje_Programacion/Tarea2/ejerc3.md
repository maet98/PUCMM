### Ejercicio 3 (4 puntos)

Exprese lo que sera impreso por el siguiente fragmento de codigo escrito en un pseudo lenguaje que usa ambito dinamico (dynamic scope) y paso de parametros por referencia:

```c
{
    int x = 1;
    int y = 1;
    void fie(reference int z) {
        z = x + x + z;
    }
    {
        int y = 3;
        {
        	int x = 3;
        }
        fie(y);
        write(y);
    }
    write(y);
}
```

Justifique su respuesta.

Se imprimira 5 1

Esto seria por los ambitos en que las variables fueron declaradas, para la funcion fie el valor de **x** seria 1. Donde luego antes de ser llamada la funcion y tiene un valor de 3, que al pasar por la función de fie daria $1+1+3 = 5$, por esto el valor de y se modificaria a 5 ya que es pasado por referencia y se imprime este valor. Al salir de este ambito, este valor retornara al valor que se le fue puso anteriormente **1** y se imprimira el valor.