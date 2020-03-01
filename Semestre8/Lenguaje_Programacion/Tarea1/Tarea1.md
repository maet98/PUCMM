## Ejercicio 1

## Eiffel

Eiffel es un lenguaje de programación orientado a objetos el cual tiene implementado un recolector de basura para la administración del uso de memoria, no es case sensitive, es capaz de realizar multihilos, se puede hacer herencia múltiple y también repetida, maneja excepciones, heredas sus palabras reservadas de **ALGOL** y utiliza una traducción a código **C** para ser ejecutado.

Este lenguaje ha sido influido por lenguajes como :

- ALGOL 
-  ADA
-  Z  

Por el otro lado esta ha influido lenguajes como:

- D
- Java
- C#
- Sather
- Ruby

Eiffel Language. (2020). Retrieved from https://www.eiffel.com/resources/faqs/eiffel-language/#classic-how
Lenguaje de programación Eiffel - EcuRed. (2020). Retrieved fromhttps://www.ecured.cu/Lenguaje_de_programaci%C3%B3n_Eiffel

### Perl

Perl es un lenguaje imperativo que esta basado de la programación shell y por lo tanto todas las variables tienen que ser precedidas por un $, los bloques de códigos están delimitados por llaves( {} ), contiene estructuras de control, subrutinas y otras características del lenguaje **C**,  Cambien posee el has de **AWK**, las expresiones regulares de sed y las listas de **LISP**. En Perl 5 se introdujo características para las estructuras de datos complejas, que permiten la programación orientada a objetos. 

Perl ha sido influido por lenguajes como:

- C
- LISP
- AWK
- C++
- UNIX shell
- Pascal
- sed
- Smalltalk 80

Ha influido en lenguajes como:

- Python
- Ruby
- ECMAScript
- PHP
- LPC
- JavaScript
- Falcon
- Windows Powershell

Perl - EcuRed. (2020). Retrieved from https://www.ecured.cu/Perl

Perl - lenguajesdeprogramacion(2020). Retrieved from https://lenguajesdeprogramacion.net/perl/

### Python

Python es un lenguaje de programación multiparadigma  pero principalmente utilizado el orientado a objetos, aunque incorpora aspectos de la programación imperativa, funcional y procedural, es un lenguaje interpretado, utiliza un tipado dinámico. El hecho que sea interpretado hace que tienda a ser mas lento a la hora de corrida comparado con lenguajes compilados. Ademas posee un modo interactivo donde se puede probar varias funcionalidades del lenguaje. 

Los lenguajes que influyeron a pyhton fueron:

- ABC
- C
- Icon
- ALGOL 68
- Perl
- Java
- Smalltalk
- Java
- LISP

Mientras que lo que han sido influido por este son:

- Boo
- D
- Cobra
- Genie
- Falcon
- Ruby
- Groovy
- Cynthon
- JavaScript
- Go

Alvarez, M. (2020). Qué es Python. Retrieved from https://desarrolloweb.com/articulos/1325.php

Python - EcuRed. (2020). Retrieved from https://www.ecured.cu/Python

## Ejercicio 2

Este formato libre hace que la legibilidad del código decaiga ya que permite que se pueda hacer una aberraciones al escribir los código que a su vez hará que el código sea casi imposible de descifrar. Sin embargo para las personas que comiencen con este tipo de lenguaje tiende cierta ayuda ya que estos tienden a olvida el carácter de finalizacion de una sentencia pero esto trae grandes consecuencias ya que al escribir dos sentencias en una misma linea, no hay forma de distinguir donde termina una y comienza otra lo que trae un error. Por el otro lado, los lenguajes con terminación no tienen este problemas ya que solo son dos sentencias en una lineas.



## Ejercicio 3



**Gramatica**
$$
DIGITO\ \rightarrow 0|1|2|3|4|5|6|7|8|9 \\
NUMBER \rightarrow NUMBER\ DIGITO | DIGITO \\ 
MANTISA \rightarrow .SYMBOL \\
SYMBOL \rightarrow +|- \\
COMB \rightarrow e| e SYMBOL \\
EXP \rightarrow NUMBER\ MANTISA\ COMB\ NUMBER | NUMBER\ COMB\ NUMBER
$$




**Expresion Regular**

```
dig =[0-9]

{dig}+("."{dig}+)?[eE]("+"|"-")?{dig}+
```

**Automata**

![](/home/miguel/Repository/PUCMM/Semestre8/Lenguaje_Programacion/Tarea1/3.png)

### Ejercicio 4

**Imperativo**

La representación de una maquina de estados.

Dado que el concepto de estados que utiliza el paradigma imperativo es perfecto para poder representar las transiciones en una maquina de estados.

**Orientado a Objetos**

En un zoológico con distintas especies de animales se necesita clasificar cada uno de los que se encuentra ahí para saber como mantenerlos.

El paradigma orientado a objeto permite la herencia que permite la agrupaciónQ de las diferentes especies en un mismo grupo. Donde también se le puede aplicar el polimorfismos para saber definir los distintos procedimientos para cada especie.

**Funcionales**

Se necesita calcular el conjunto de mandelbroot.

El paradigma funcional hace que funciones como estas sea muy fáciles de representar de manera similar a como seria en las matemáticas.

**Declarativo**

Se necesita especificar como estarán estructuradas las tablas en una base de datos.

Este paradigma es el indicado en este caso ya que permite la declarar reglas para tratar los datos entrante si ningún efecto ante la data entrante.

**Visual**

Se necesita simular un circuito eléctrico para analizar el voltaje y la corriente.

El paradigma visual ofrece una interfaz visual que da facilidad a la hora de analizar las conexiones del circuito y permite la paralelizacion del problema.	