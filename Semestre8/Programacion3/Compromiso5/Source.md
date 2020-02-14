### Compromiso 2.1 -Set de Ejercicios - Gramaticas Independientes del Contexto

---

1. Sea $G_1$ la gramatica independiente del contexto dada mas abajo:

   - $S \rightarrow AA$
   - $A \rightarrow AAA|a|bA|Ab$

   a) Construir la derivacion por la izquierda de la cadena $b^2aba^2ba$.
$$
S\rightarrow AA\\
\rightarrow bAA\\
   \rightarrow\ bbAA \\
   \rightarrow\ bbAbA \\
   \rightarrow bbabA\\
   \rightarrow\ bbabAAA \\
   \rightarrow\ bbabaAA \\
   \rightarrow\ bbabaaA \\
   \rightarrow\ bbabaabA \\
   \rightarrow\ bbabaaba
$$


   b) Construir la derivacion por la derecha de la cadena $b^2aba^2ba$.
$$
   S\rightarrow AA\\
   \rightarrow AbA\\
   \rightarrow Aba \\
   \rightarrow AAAba \\
   \rightarrow AAaba \\
   \rightarrow Aaaba \\
   \rightarrow Abaaba \\
   \rightarrow bAbaaba \\
   \rightarrow bbAbaaba \\
   \rightarrow bbabaaba
$$


   c) Justificar el porque el lenguaje de esta gramatica, $L(G_1)$ puede contener cadenas de la forma
$$
b^{m_1}ab^{m_2}a \ldots b^{m_{2n}}ab^{m_{2n+1}} donde\ n > 0\ y\ m_1, m_2, \ldots, m_{2n+1} \geq 0
$$

Este tipo de cadenas con admitidas en el lenguaje ya que por las reglas de las gramticas $A\rightarrow bA$ y $A\rightarrow AAA$ hace que sea facil conseguir cualquier $b^{m_1}$. Tambien que esten separadas por una a es muy simple dado $A\rightarrow a$. En si el hecho de como esta estructurada la gramatica hace que esa forma de la cadena sea posible de representar.







2.. Especificar las gramáticas independientes del contexto cuyo lenguajes asociados se  dan a continuación. Para cada gramática propuesta, justifique el porqué  la misma produce/caracteriza el lenguaje dado:

   - $L(G_1) = \{a^m b^n | n \leq m \leq 2n\}$
     $$
     S\rightarrow aSb|aaSb|\epsilon
     $$
     
- $L(G_2) = \{a^mb^nc^pd^q | m + n \geq p + q\}$
     $$
     S\rightarrow Sac|Sad|Sbc|Sbd|Sa|Sb|\epsilon
     $$
     

3. Lean el capítulo 3 del libro de Louden *"Construcción de Compiladores: Principios y Práctica"* (cuyos datos bibliográficos se dan en el programa).

   **3.8** Refiéranse a las páginas 138 ~142 del libro y capítulos antes mencionados y realicen los ejercicios que se indican más abajo

   - 3.1

     - a) Write down an unambiguous grammar that generates the set of strings 
       $$
       \{s;,s;s;,s;s;s;,\dots\}
       $$

   

   <center><bold>Gramatica</bold></center>
$$
   S \rightarrow s;S\ |\ \epsilon\ | S s;
$$



​		b) Give the leftmost and rightmost derivation for the string **s;s;** using your grammar

**Derivacion por la izquierda**
$$
S \rightarrow\ s;S\\
\rightarrow s;s;S\\
\rightarrow\ s;s;
$$
**Derivacion por la derecha**
$$
S\rightarrow Ss;\\
\rightarrow Ss;s; \\
\rightarrow s;s;
$$


**3.3** Given the grammar
$$
exp \rightarrow exp\ addop\ term\ | term\\
addop \rightarrow\ +|-\\
term \rightarrow term\ mulop\ factor\ |\ factor\\
mulop\rightarrow\ *\\
factor\rightarrow\ (\ exp\ )\ | \mathbf{number}
$$
write down leftmost derivations, parse trees, and abstract syntax trees for the following expressions:

**a. $3+4*5-6$**
$$
exp \rightarrow exp\ addop\ term\\
\rightarrow exp\ addop\ term\ addop\ term\\
\rightarrow factor\ addop\ term\ addop\ term\\
\rightarrow 3\ addop\ term\ addop\ term\\
\rightarrow 3\ +\ term\ addop\ term\\
\rightarrow 3\ +\ term\ mulop\ factor\ addop\ term\\
\rightarrow 3\ +\ factor\ mulop\ factor\ addop\ term\\
\rightarrow 3\ +\ 4\ mulop\ factor\ addop\ term\\
\rightarrow 3\ +\ 4\ *\ factor\ addop\ term\\
\rightarrow 3\ +\ 4\ *\ 5\ addop\ term\\
\rightarrow 3\ +\ 4\ *\ 5\ -\ term\\
\rightarrow 3\ +\ 4\ *\ 5\ -\ factor\\
\rightarrow 3\ +\ 4\ *\ 5\ -\ 6\\
$$


![](/home/miguel/Repository/PUCMM/Semestre8/Programacion3/Compromiso5/3.3A.png)

![](/home/miguel/Repository/PUCMM/Semestre8/Programacion3/Compromiso5/3.3A.2.png)

**b. $3*(4-5+6)$**
$$
exp \rightarrow term\\
\rightarrow term\ mulop\ factor\ \\
\rightarrow factor\ mulop\ factor\ \\
\rightarrow 3\ mulop\ factor\ \\
\rightarrow 3\ *\ factor\ \\
\rightarrow 3\ *\ (exp)\ \\
\rightarrow 3\ *\ (exp\ addop\ term\ ) \\
\rightarrow 3\ *\ (exp\ addop\ term\ addop\ term\ ) \\
\rightarrow 3\ *\ (term\ addop\ term\ addop\ term\ ) \\
\rightarrow 3\ *\ (factor\ addop\ term\ addop\ term\ ) \\
\rightarrow 3\ *\ (4\ addop\ term\ addop\ term\ ) \\
\rightarrow 3\ *\ (4\ -\ term\ addop\ term\ ) \\
\rightarrow 3\ *\ (4\ -\ factor\ addop\ term\ ) \\
\rightarrow 3\ *\ (4\ -\ 5\ addop\ term\ ) \\
\rightarrow 3\ *\ (4\ -\ 5\ +\ term\ ) \\
\rightarrow 3\ *\ (4\ -\ 5\ +\ factor\ ) \\
\rightarrow 3\ *\ (4\ -\ 5\ +\ 6\ ) \\
$$


![](/home/miguel/Repository/PUCMM/Semestre8/Programacion3/Compromiso5/3.3B.png)	

![](/home/miguel/Repository/PUCMM/Semestre8/Programacion3/Compromiso5/3.3B.2.png)

**c. $3-(4+5*6)$**
$$
exp \rightarrow exp\ addop\ term\\
\rightarrow term\ addop\ term\\
\rightarrow factor\ addop\ term\\
\rightarrow 3\ addop\ term\\
\rightarrow 3\ -\ term\\
\rightarrow 3\ -\ factor\\
\rightarrow 3\ -\ (exp)\\
\rightarrow 3\ -\ (exp\ addop\ term\ )\\
\rightarrow 3\ -\ (term\ addop\ term\ )\\
\rightarrow 3\ -\ (factor\ addop\ term\ )\\
\rightarrow 3\ -\ (4\ addop\ term\ )\\
\rightarrow 3\ -\ (4\ +\ term\ )\\
\rightarrow 3\ -\ (4\ +\ term\ mulop\ factor\ )\\
\rightarrow 3\ -\ (4\ +\ factor\ mulop\ factor\ )\\
\rightarrow 3\ -\ (4\ +\ 5\ mulop\ factor\ )\\
\rightarrow 3\ -\ (4\ +\ 5\ *\ factor\ )\\
\rightarrow 3\ -\ (4\ +\ 5\ *\ 6\ )\\
$$
![](/home/miguel/Repository/PUCMM/Semestre8/Programacion3/Compromiso5/3.3C.png)



![](/home/miguel/Repository/PUCMM/Semestre8/Programacion3/Compromiso5/3.3C.2.png)

**3.8** Given the following grammar
$$
statement \rightarrow if-stmt |\ \mathbf{other}\ | \epsilon\\
if-stmt \rightarrow \mathbf{if}\ (\ exp\ )\ statement\ else-part\\
else-part \rightarrow \mathbf{else}\ statement\ | \epsilon\\
exp \rightarrow \mathbf{0}|\mathbf{1}
$$
**a.** Draw a parse tree for the string
$$
\mathbf{if(0)\ if(1)\ other\ else\ else\ other}
$$
![](/home/miguel/Repository/PUCMM/Semestre8/Programacion3/Compromiso5/3.8A.png)

**b.** What is the purpose of the two **else**'s?

el primer else es necesario ya que forma parte del segundo if y la gramatica dice que else-part esta formado por else statement | $\epsilon$ en este caso se eligio el $\epsilon$. Mientras que el segundo **else** es del primer if y este se deriva del **else** statement, luego se deriva a **other**.

**c.** Is similiar code permissible in C? Explain.

No, ya que en C es necesario que se ponga un statement despues de un else para que la sintaxis este correcta.

**3.13** Consider the following simplificaiton of the grammar of Exercise 3.6.
$$
lexp \rightarrow \mathbf{number}|(\ op\ lexp-seq)\\
op\rightarrow +|-|*\\
lexp-seq \rightarrow\ lexp-seq\ lexp\ |\ lexp
$$
This grammar can be thought of as representing simple integer arithmetic expressions in
LISP-like prefix form. For example, the expression $34-3*42$ would be written in this
grammar as $(\ -\ 34 (\ *\ 3\ 42))$.

**a.** What interpretation should be given to the legal expressions $(- 2\ 3\ 4\ )$ and
$(-\ 2\ )$ ? What about the expressions $(\ +\  2)$ and $(\ *\ 2)$ ?
$$
(-\ 2\ 3\ 4\ ) = 2 - 3 -4 = -5\\
(-2) = 0- 2 = -2\\
(+2) = 0+2 = 2\\
(*2) = 1*2 = 2
$$


**b.** Are precedence and associativity a problem with this grammar? Is the grammar
ambiguous?

El lenguaje en si no es asociativo por el uso de los parentesis que especifican en que orden se realizaran las operaciones (precedencia), por esto la gramatica no es ambigua.



**3.19** In some languages (Modula-2 and Ada are examples), a procedure declaration is
expected to be terminated by syntax that includes the name of the procedure. For 
example, in Modula-2 a procedure is declared as follows:

```
PROCEDURE P;
BEGIN
	...
END P;
```

Now the use of the procedure name **P** after the closing **END**. Can such a requirement be checked by a parser? Explain.

No, ya que se le puede expecificar que despues del END debe ir un **ID** pero el hecho de que este sea igual al que va despues de PROCEDURE ya no es parte de la sintaxis sino de la semantica.

**3.20 a.** Write a grammar that generates the same language as the following regular expression:
$$
(a|c|ba|bc)*(b|\epsilon)
$$




$$
\mathbf{Gramatica}\\
S \rightarrow a|c|ba|bc|\epsilon\ S\ SUF\\
SUF \rightarrow b|\epsilon
$$









### 2017-0200 Miguel Estevez

